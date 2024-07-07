---
tags: [ website, blog ]
---

# Personal blog setup

I have multiple markdown notes that can be published as a blog post. 

Now I want to figure out a way without much setup on how to create a blog from them.

That includes:
 - minimal/no javascript setup
 - same theme as my peersonal website
 - category support
 - static hosting
 - rss feed
 - markdown for writing
 - templating

## Tools
 - [Zola](https://www.getzola.org/)
     Zola is a rust-based static site generator with a focus on blogs.
     It does not force you into a specific directory structure.
     It only allows TOML as frontmatter.
     It's templating is using [Tera](https://keats.github.io/tera/) which is similar to Django and Liquid.
 
 - [Jekyll](https://jekyllrb.com/docs/)
    Jekyll is a ruby-based static site generator.
    It is included in Github Pages, which should make setup even easier.
    Jekyll is comparatively slow by anecdotal evidence.
    It also requires a fixed directory structure.

 - [Quarto](https://quarto.org/)
    Quarto is an extension on top of markdown and pandoc which offers conversion into multiple formats.
    It is intended for scuientific writing but can be used for blogs as well.
    I use it for my master thesis already.
    However it uses Bootsstrap for layout and does not offer real layout customisation.
    It's directory structure is also somewhat fixed.

All of these tools fit the above requirements and I have yet to make a decision.
Using Quarto would be nice as I use the tool already, but mandatory bootsstrap is terrible.
Jekyll's speed does not matter as of now, because I only have about 15 posts lined up, but using [[Ruby]] for plugins us also not my first choice.

## Setup

