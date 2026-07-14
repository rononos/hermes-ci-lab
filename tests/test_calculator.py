from src.calculator import add, multiply


def test_add():
    assert add(2, 3) == 5


def test_multiply():
    assert multiply(4, 5) == 20


def test_format_date():
    assert format_date("2026-07-14") == "14/07/2026"
