![Tests](https://github.com/kelvinwieth/replace_that_package/actions/workflows/tests.yaml/badge.svg)

# Replace That Package

Minimalist and easy-to-maintain code to replace popular packages across various programming languages. Simplify your dependencies without sacrificing functionality.

## Why Replace Packages?

Using external libraries can add complexity, dependencies, and maintenance overhead to your projects. This repository provides lightweight alternatives for popular libraries, helping you:

- Avoid unnecessary dependencies ([YAGNI](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it)).
- Write code that's simpler and easier to maintain ([Do the simplest thing that could possibly work](https://ronjeffries.com/xprog/articles/practices/pracsimplest/)).
- Reduce the size and complexity of your codebase ([Write Less Code](https://mokacoding.com/blog/write-less-code/)).

## Current Replacements

| Language | Framework | Package                                   | Code                                         | Line Reduction |
| -------- | --------- | ----------------------------------------- | -------------------------------------------- | -------------- |
| Dart     | Flutter   | [get_it](https://pub.dev/packages/get_it) | [get_it.dart](replacements/dart/get_it.dart) | ~2683 lines    |

> **Note:** "Line reduction" measures the total number of lines removed by replacing the original library.

## How to Contribute

We welcome new replacements and improvements! Follow these steps:

1. Fork this repository.
2. Create your replacement or adjust an existing one.
3. Test your code to ensure compatibility.
4. Submit your pull request.
