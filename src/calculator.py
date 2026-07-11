def add(a: int, b: int) -> int:
    """Additionne deux nombres entiers."""
    return a + b


def divide(a: float, b: float) -> float:
    """Divise a par b."""
    if b == 0:
        raise ValueError("Division by zero is not allowed")

    return a / b
