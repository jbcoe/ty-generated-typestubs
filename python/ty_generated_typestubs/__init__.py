from ty_generated_typestubs._core import add


def sub(a: int, b: int) -> int:
    return add(a, -b)


_x: int = "Mistyped"

__all__ = ["add", "sub"]
