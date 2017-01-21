def is_matrix(inp):
    if inp == []:
        return True

    return len({len(r) for r in inp}) == 1


def saddle_points(inp):
    if not is_matrix(inp):
        raise ValueError

    max_in_rows = {max(r) for r in inp}
    min_in_cols = {min(c) for c in zip(*inp)}

    intersection = max_in_rows.intersection(min_in_cols)

    pts = [(x, y) for y in range(len(inp)) for x in range(len(inp[0]))]
    return {(y, x) for (x, y) in pts if inp[y][x] in intersection}
