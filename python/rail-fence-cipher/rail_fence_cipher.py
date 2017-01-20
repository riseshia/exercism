from functools import reduce


def encode(raw, size):
    table = _translate_table(len(raw), size)
    return ''.join(raw[cipher_idx] for cipher_idx in table)

def decode(cipher, size):
    table = _translate_table(len(cipher), size)
    r = list(cipher)

    for (cipher_idx, origin_idx) in enumerate(table):
        r[origin_idx] = cipher[cipher_idx]

    return ''.join(r)

def _translate_table(length, size):
    cursor = Cursor(size)
    spl = [[] for _ in range(size)]

    for i in range(length):
        spl[cursor.next()].append(i)

    return reduce(lambda x,y: x+y, spl)


class Cursor:
    def __init__(self, size):
        self.cursor = -1
        self.order = list(range(size)) + list(range(size - 2, 0, -1))

    def next(self):
        self.cursor = (self.cursor + 1) % len(self.order)

        return self.order[self.cursor]
