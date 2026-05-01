[private]
default:
    @just --list

# Create a new note with a given title
new +name:
    zk new --no-input --title "{{ name }}"

# Create a new note tracking a website
new-site +name:
    zk new --no-input --title "{{ name }}" --template website.md

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
