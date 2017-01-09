import re

def _encode_chars(chars):
    length = len(chars)
    if length == 1:
        return chars[0]
    else:
        return f'{length}{chars[0]}'

def encode(raw_string):
    tokens = [m.group() for m in re.finditer(r'(\D)\1*', raw_string)]
    return ''.join([_encode_chars(token) for token in tokens])

def decode(encoded_string):
    mos = re.finditer(r'(\d*)(\D)', encoded_string)
    tokens = [(int(m.group(1) or '1'), m.group(2)) for m in mos]
    return ''.join([char * length for (length, char) in tokens])
