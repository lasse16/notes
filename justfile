[private]
default:
    @just --list

# Create a new note with a given title
new +name:
    zk new --no-input --title "{{ name }}"

# List all notes
list:
    zk list --format oneline

# Interactively select a note to edit
edit:
    zk edit --interactive

# List all tags in use
tags:
    zk tag --no-input
