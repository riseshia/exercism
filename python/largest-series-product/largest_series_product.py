from functools import reduce


def largest_product(digits, width):
    if len(digits) < width or width < 0:
        raise ValueError
    numbers = [int(d) for d in digits]

    max = 0
    for i in range(0, len(numbers) - width + 1):
        product = reduce(lambda x, y: x * y, numbers[i:i+width], 1)
        if max < product:
            max = product
    return max
