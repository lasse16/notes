[private]
default:
    @just --list

# Create a new note with a given title
new +name:
    zk new --no-input --title "{{ name }}"

# Create a new note tracking a website
new-site url *name:
    #!/usr/bin/env bash
    URL={{ url }}
    TITLE="{{ name }}"
    if [ -z "$TITLE" ]; then
        TITLE=$(curl -Ls $URL | rg -oP '(?<=<title>).*?(?=</title>)')
        if [ -z "$TITLE" ]; then
            echo "Warning: Could not extract title from webpage, using URL as title"
            TITLE="$URL"
        fi
    fi

    zk new --no-input --title "$TITLE" --template website.md --extra url="$URL"

# List all notes
list:
    zk list --format oneline

# Interactively select a note to edit
edit:
    zk edit --interactive

# List all tags in use
tags:
    zk tag --no-input

# Full-text search across notes including title, metadata and body
full-text:
    zk list --format oneline -i

# Run several checks on all notes
@housekeeping:
    echo "NOTEBOOK Housekeeping"
    echo "---------------------"
    echo "Untagged notes:"
    zk list --tagless --format path --no-pager --quiet
    echo ""
    echo "Dead links:"
    zk dead-links
    echo ""
    echo "Potential links:"
    zk list --quiet --format path --delimiter0 $@ | xargs -0 zk unlinked-mentions
