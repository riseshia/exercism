def sum_of_multiples(number, bases):
    nzbs = [b for b in bases if b != 0]
    candidates = [n for n in range(1, number) if any(n % b == 0 for b in nzbs)]

    return sum(candidates)
