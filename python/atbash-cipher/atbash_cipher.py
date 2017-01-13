from string import ascii_lowercase, digits

def decode(encoded_string):
    return ''.join(_convert(encoded_string))

def encode(raw_string):
    chars = _convert(raw_string.lower())
    group_size = 5
    return ' '.join(
        [''.join(chars[i:i + group_size]) for i in range(0, len(chars), group_size)]
    )

def _build_dict():
    keys = ascii_lowercase + digits
    values = ''.join(reversed(ascii_lowercase)) + digits
    return {k:v for k, v in zip(keys, values)}

def _convert(string):
    table = _build_dict()
    return [table[c] for c in string if c in table]
