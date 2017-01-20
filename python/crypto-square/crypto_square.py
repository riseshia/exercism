from math import sqrt


def encode(raw):
    normalized = [c for c in raw.lower() if c.isalnum()]
    col_size = _calculate(len(normalized))

    return ' '.join(
                ''.join(normalized[i::col_size]) for i in range(col_size)
           )


def _calculate(size):
    x = int(sqrt(size))
    if x ** 2 == size:
        return x
    else:
        return x + 1
