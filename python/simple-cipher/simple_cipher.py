from string import ascii_lowercase

def _trans(char, shift):
    reverse_shift = len(ascii_lowercase) - shift
    x = ord(char)
    if 96 < x + shift < 123:
        return chr(x + shift)
    else:
        return chr(x - reverse_shift)


class Caesar:
    def __init__(self, shift = 3):
        self.shift = shift

    def encode(self, raw):
        return ''.join(_trans(x, self.shift) for x in raw.lower()
                       if x in ascii_lowercase)

    def decode(self, encoded):
        return ''.join(_trans(x, -self.shift) for x in encoded)


class Cipher:
    def __init__(self, seed):
        self.seed = Seed(seed)

    def encode(self, raw):
        return ''.join(_trans(x, self.seed.next()) for x in raw)


class Seed:
    def __init__(self, string):
        self.seed = [ascii_lowercase.index(char) for char in string]
        self.idx = -1

    def next(self):
        self.idx += 1
        if self.idx == len(self.seed):
            self.idx = 0

        return self.seed[self.idx]
