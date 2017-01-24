patterns = [
    [' _ ', '| |', '|_|', '   '], # 0
    ['   ', '  |', '  |', '   '], # 1
    [' _ ', ' _|', '|_ ', '   '], # 2
    [' _ ', ' _|', ' _|', '   '], # 3
    ['   ', '|_|', '  |', '   '], # 4
    [' _ ', '|_ ', ' _|', '   '], # 5
    [' _ ', '|_ ', '|_|', '   '], # 6
    [' _ ', '  |', '  |', '   '], # 7
    [' _ ', '|_|', '|_|', '   '], # 8
    [' _ ', '|_|', ' _|', '   '], # 9
]


def _recognize(digit):
    for idx, pattern in enumerate(patterns):
        if digit == pattern: 
            return str(idx)

    return '?'


def _assert_number(digits):
    if len(digits) != 4:
        raise ValueError

    width = len(digits[0])
    if width % 3 != 0:
        raise ValueError

    for row in digits:
        if len(row) != width:
            raise ValueError


def _split(img):
    digits = []

    num = len(img[0]) // 3
    for i in range(num):
        idx = i * 3
        digits.append([
            img[0][idx:idx + 3],
            img[1][idx:idx + 3],
            img[2][idx:idx + 3],
            img[3][idx:idx + 3],
        ])

    return digits


def number(img):
    _assert_number(img)
    return ''.join(_recognize(digit) for digit in _split(img))


def grid(digits):
    raw = [patterns[int(d)] for d in digits]
    return [''.join(d[i] for d in raw) for i in range(4)]
