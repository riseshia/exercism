from math import gcd


def triplets_in_range(s, e):
    rs = set() 
    for i in range(4, e + 1, 2):
        rs = rs | primitive_triplets(i)

    # generate triplets base on primitives
    additional_l = []
    for (a, b, c) in rs:
        if c < e:
            n = 2
            while n * c <= e:
                additional_l.append((a * n, b * n, c * n))
                n += 1
    rs = rs | set(additional_l)

    frs = {(a, b, c) for (a, b, c) in rs if a >= s and c <= e}
    return frs


def primitive_triplets(b):
    if b % 2 == 1:
        raise ValueError('argument should be even')

    # find m, n candidate
    splits = _split(b // 2)
    # a, b should be odd
    l = [(a, b) for (a, b) in splits if (a + b) % 2 == 1 and gcd(a, b) == 1]
    sorted_l = [(m, n) if m > n else (n, m) for (m, n) in l]
    # generate triplets
    r_l = [(m**2 - n**2, 2 * m * n, m**2 + n**2) for (m, n) in sorted_l]
    rs_l = [(a, b, c) if a < b else (b, a, c) for (a, b, c) in r_l]

    return set(rs_l)


def is_triplet(t):
    [a, b, c] = sorted(list(t))
    return a ** 2 + b ** 2 == c ** 2


def _split(n):
    last_n = n // 2 + 1
    l = []

    for a in range(1, last_n):
        b, rem = divmod(n, a)
        if not rem:
            l.append((a, b))

    return l
