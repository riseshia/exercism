from functools import reduce

def largest_product(digits, width):
    if len(digits) < width or width < 0:
        raise ValueError
    elif len(digits) == 0 or width == 0:
        return 1
    numbers = [int(d) for d in digits]

    max = 0
    for i in range(0, len(numbers) - width + 1):
        product = reduce(lambda x, y: x * y, numbers[i:i+width])
        if max < product:
            max = product
    return max
