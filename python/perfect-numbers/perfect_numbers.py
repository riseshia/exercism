from math import sqrt


def _factors(number):
    l = [1]
    for i in range(2, int(sqrt(number)) + 1):
        if number % i == 0:
            l.append(i)
            l.append(number // i)

    return l

def is_perfect(number):
    return sum(_factors(number)) == number
