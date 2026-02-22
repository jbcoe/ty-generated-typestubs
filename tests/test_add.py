from ty_generated_typestubs import add as tadd
import pytest


def test_add():
    assert tadd(1, 2) == 3


def test_add_negative():
    assert tadd(-1, -2) == -3


def test_add_zero():
    assert tadd(0, 0) == 0


def test_add_mixed():
    assert tadd(1, -1) == 0


def test_add_type_error():
    with pytest.raises(TypeError):
        tadd("a", "b")
