# Minimal Python Extension with Typestubs

This project is a minimal example of a Python module with a C++ extension that generates typestubs for the extension.

This project requires `uv`, see: https://github.com/astral-sh/uv?tab=readme-ov-file#installation.

## The Problem

Although the typestubs are installed alongside the shared library, typecheckers such as [ty](https://github.com/astral-sh/ty) are unable to find the typestubs and report errors.

## Problematic behaviour using ty

```sh
uv run ty check
error[unresolved-import]: Cannot resolve imported module `._core`
 --> ty_generated_typestubs/__init__.py:1:7
  |
1 | from ._core import add
  |       ^^^^^
2 |
3 | __all__ = ["add"]
  |
info: Searched in the following paths during module resolution:
info:   1. /Users/jbcoe/jbcoe.github/ty-generated-typestubs/src (first-party code)
info:   2. /Users/jbcoe/jbcoe.github/ty-generated-typestubs (first-party code)
info:   3. vendored://stdlib (stdlib typeshed stubs vendored by ty)
info:   4. /Users/jbcoe/jbcoe.github/ty-generated-typestubs/.venv/lib/python3.13/site-packages (site-packages)
info: make sure your Python environment is properly configured: https://docs.astral.sh/ty/modules/#python-environment
info: rule `unresolved-import` is enabled by default
```

## Expected Behavior

Typecheckers should be able to find the typestubs and not report any errors.
