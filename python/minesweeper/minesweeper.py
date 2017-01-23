def board(inp):
    height = len(inp)
    width = len(inp[1])
    max_y = height - 1
    max_x = width - 1

    if any(len(row) != width for row in inp):
        raise ValueError('all rows should have same length')
    _assert_border(inp, max_y, max_x)

    base_inp = [list(row) for row in inp]

    for y in range(1, max_y):
        for x in range(1, max_x):
            if base_inp[y][x] == ' ':
                base_inp[y][x] = _inspect_around(base_inp, y, x)
            elif base_inp[y][x] != '*':
                raise ValueError(
                    f'{base_inp[y][x]} is not valid value for minesweeper')

    return [''.join(row) for row in base_inp]


def _assert_border(inp, max_y, max_x):
    try:
        assert inp[0][0] == '+'
        assert inp[0][max_x] == '+'
        assert inp[max_y][0] == '+'
        assert inp[max_y][max_x] == '+'

        for x in range(1, max_x):
            assert inp[0][x] == '-' and inp[max_y][x] == '-'

        for y in range(1, max_y):
            assert inp[y][0] == '|' and inp[y][max_x] == '|'

    except AssertionError:
        raise ValueError('Border has invalid value')


def _inspect_around(inp, y, x):
    vs = [(0, 1), (-1, 1), (-1, 0), (-1, -1), (0, -1), (1, -1), (1, 0), (1, 1)]
    s = sum(1 for dy, dx in vs if inp[y + dy][x + dx] == '*')

    if s == 0:
        return ' '
    else:
        return str(s)
