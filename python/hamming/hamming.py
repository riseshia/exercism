def distance(code_a, code_b):
    length = len(code_a)
    if length != len(code_b):
        raise ValueError('the length of two codes is different.')

    return sum([1 for (c_a, c_b) in zip(code_a, code_b) if c_a != c_b])
