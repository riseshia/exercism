KEYWORDS = ['wink', 'double blink', 'close your eyes', 'jump', 'reverse']
encode_table = {2 ** i:KEYWORDS[i] for i in range(len(KEYWORDS))}
decode_table = {v:k for k, v in encode_table.items()}

def handshake(number):
    if isinstance(number, str):
        try:
            number = int(number, 2)
        except:
            return []

    if number < 0:
        return []

    dl = []
    for d, word in encode_table.items():
        if number & d:
            if word == 'reverse':
                dl.reverse()
            else:
                dl.append(word)
    return dl

def code(l):
    dl = [decode_table[word] for word in l if word in decode_table]
    if len(dl) != len(l):
        return '0'

    if sorted(dl) != dl:
        dl.append(16)
        dl.reverse()

    return bin(sum(dl))[2:]
