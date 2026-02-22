# Minimal Python Extension with Typestubs

This project is a minimal example of a Python module with a C++ extension that generates typestubs for the extension.

This project requires `uv`, see: https://github.com/astral-sh/uv?tab=readme-ov-file#installation.

## The Problem

Although the typestubs are installed alongside the shared library, typecheckers such as [ty](https://github.com/astral-sh/ty) are unable to find the typestubs and report errors.

## Problematic behaviour

### Using ty (no typestubs found)

```sh
uv run ty check
error[unresolved-import]: Cannot resolve imported module `ty_generated_typestubs._core`
 --> python/ty_generated_typestubs/__init__.py:1:6
  |
1 | from ty_generated_typestubs._core import add
  |      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
2 |
3 | __all__ = ["add"]
  |
info: Searched in the following paths during module resolution:
info:   1. /Users/jbcoe/jbcoe.github/ty-generated-typestubs/python (first-party code)
info:   2. /Users/jbcoe/jbcoe.github/ty-generated-typestubs (first-party code)
info:   3. vendored://stdlib (stdlib typeshed stubs vendored by ty)
info:   4. /Users/jbcoe/jbcoe.github/ty-generated-typestubs/.venv/lib/python3.13/site-packages (site-packages)
info: make sure your Python environment is properly configured: https://docs.astral.sh/ty/modules/#python-environment
info: rule `unresolved-import` is enabled by default

error[invalid-assignment]: Object of type `Literal["The wrong type"]` is not assignable to `int`
 --> python/ty_generated_typestubs/__init__.py:5:11
  |
3 | __all__ = ["add"]
4 |
5 | mistyped: int = "The wrong type"
  |           ---   ^^^^^^^^^^^^^^^^ Incompatible value of type `Literal["The wrong type"]`
  |           |
  |           Declared type
  |
info: rule `invalid-assignment` is enabled by default
```

### Using pyrefly (no source found at all)

```
uv run pyrefly check
 INFO Found `/Users/jbcoe/jbcoe.github/ty-generated-typestubs/pyproject.toml` marking project root, checking root directory with default configuration
```

## Expected Behavior

Typecheckers should be able to find the source and the typestubs and not report any errors.
