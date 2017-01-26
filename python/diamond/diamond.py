from string import ascii_uppercase


def make_diamond(target):
    # base
    order = ascii_uppercase.index(target)
    size = order * 2 + 1
    board = [[' '] * size for _ in range(size)]

    # write characters
    l = list(ascii_uppercase[:order+1]) \
        + list(reversed(ascii_uppercase[:order]))
    md_idx = size // 2
    for idx, char in enumerate(l):
        dx = abs(idx - md_idx)
        board[idx][dx] = char
        board[idx][size - dx - 1] = char

    return '\n'.join(''.join(row) for row in board) + '\n'
