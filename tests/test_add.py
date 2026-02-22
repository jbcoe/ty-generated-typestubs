import ty_generated_typestubs
import pytest


def test_add():
    assert ty_generated_typestubs.add(1, 2) == 3


def test_add_negative():
    assert ty_generated_typestubs.add(-1, -2) == -3


def test_add_zero():
    assert ty_generated_typestubs.add(0, 0) == 0


def test_add_mixed():
    assert ty_generated_typestubs.add(1, -1) == 0


def test_add_type_error():
    with pytest.raises(TypeError):
        ty_generated_typestubs.add("a", "b")
