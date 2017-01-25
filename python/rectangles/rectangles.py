def count(lines = None):
    if not isinstance(lines, list):
        return 0

    height = len(lines)
    width = len(lines[0])

    return sum(
        detect(lines, h, w)
        for w in range(1, width)
        for h in range(2, height, 2)
    )


def detect(lines, wh, ww):
    height = len(lines)
    width = len(lines[0])

    count = 0    
    for x in range(width - ww):
        for y in range(height - wh):
            if is_rectangle(lines, x, y, ww, wh):
                count += 1

    return count


def is_rectangle(lines, x, y, ww, wh):
    if not (lines[y][x] == '+' and lines[y][x+ww] == '+' \
            and lines[y+wh][x] == '+' and lines[y+wh][x+ww] == '+'):
        return False

    for c in range(x + 1, x + ww):
        if not (lines[y][c] in '+-' and lines[y+wh][c] in '+-'):
            return False
    for c in range(y + 1, y + wh):
        if not (lines[c][x] in '+|' and lines[c][x+ww] in '+|'):
            return False
    return True
