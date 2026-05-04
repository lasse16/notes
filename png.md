---
date: 2026-05-04
tags: [ raster_graphics ]
aliases: [  "png", ".png" ]
---

# PNG: Portable network graphics

A [Raster graphics](raster-graphics) image format.

Its storage format contains a header with information about color palette, image dimensions and interlacing.
Followed by a main body, in which each chunk describes its difference from the previous chunk as a `RGBa` tuple.

It is a lossless way of storing an image.

## References

- <https://en.wikipedia.org/wiki/PNG>
