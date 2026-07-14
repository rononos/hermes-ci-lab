def add(a: int, b: int) -> int:
    """Additionne deux nombres entiers."""
    return a + b


def multiply(a: int, b: int) -> int:
    """Multiplie deux nombres entiers."""
    return a * b


def format_date(date_string: str) -> str:
    """Formate une date avec la bibliothèque Pendulum."""
    import pendulum

    date = pendulum.parse(date_string)
    return date.format("DD/MM/YYYY")
