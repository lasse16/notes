---
date: 2026-06-08
tags: [ just, cli ]
---

# just

A command runner for project-specific commands.

It is configured by a `.justfile`, whose syntax mimicks `make`.

## Example

```just
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

    zk new --no-input --title "$TITLE" --template website.md --extra url="$URL" references/
```

Each command is called a recipe, so the example has 3 recipes.

One is `[private]` and will not be shown with `just --list`.
The other two will be shown with the comment directly above as their documentation.
It is also possible to specify documentation with the `[doc("<text>")]` attribute.

Most features are established via attributes above the recipe definition.
You can view [the full list of attributes][attribute-list], but my most used ones, are `[private]` and `[working-directory('path')]`.

Anything following the recipe name is a parameter, which can be used inside the recipe with the `{{ var }}` syntax.
`+name`, and `*name` collect all remaining passed args, which can be one/zero or more, into the `name` variable.

`@<command>` avoids echoing the command inside a recipe before running it.

A command named `default` will be run, when no other subcommand is specified, i.e. `just` is called from the cli.

### Tricks

#### Recursive `just` recipes

If you want to call another recipe from inside a `just` file, there are multiple ways to do this.

1. Specify it as a dependency with `<command>: <other command>`
    This will run it before your recipe.
2. Specify it as a subsequent with `<command>: &&<other command>`
    This will run after your recipe.
3. Call it again with `just <command>`
    This will call it as you would call it, so creates an entirely new evaluation context.

See the [manual section on dependencies](https://just.systems/man/en/dependencies.html?highlight=subseq#dependencies) for more.

#### Multiple `just` files

You can split recipes into multiple `just` files, these must have the `.just` extension and function as modules which can be called with `just <name>::<command>`.
Import modules with `mod <name> '<file_path>`.

#### Script recipes

Normally every line in a recipe is executed as a single statement in a new shell.
If you specify a SHEBANG, then that entire recipe is executed as a single script by what that SHEBANG specified.

This can be used to write [[bash]] scripts, but also [[python]] scripts.

## References

- <https://just.systems/man/en/>
- <https://www.jonashietala.se/blog/2026/05/28/just_command_runner_documentation/>
- [attribute-list]

[attribute-list]: <https://just.systems/man/en/attributes.html>
