# Mktemp

Creates a unique temporary file or directory and returns the absolute path to it.

## Table of contents <!-- omit in toc -->

1. [TL;DR](#tldr)
1. [Further readings](#further-readings)

## TL;DR

```sh
# create an empty temporary file
mktemp

# create an empty temporary directory
mktemp -d

# create an empty temporary file or directory with a random templated name
# the Xs must be put at the end of the filename
# the Xs specifies the templated parts and length in the file name
mktemp /tmp/filenameXXX
mktemp -d /tmp/dirname.XXX

# create an empty temporary file or directory with a specified suffix (GNU only)
mktemp --suffix ".txt"

# create an empty temporary file or directory with a specified prefix
mktemp -t "txt"
```

## Further readings

- [Man page]

<!--
  References
  -->

<!-- Upstream -->
[man page]: https://www.gnu.org/software/autogen/mktemp.html
