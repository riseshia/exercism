trans_table = {
    1: 'one', 2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    14: 'fourteen'
}

tenth_table = {
    80: 'eighty',
    50: 'fifty',
    40: 'forty',
    30: 'thirty',
    20: 'twenty'
}

trans_table.update(tenth_table)

def say(number):
    number = int(number)
    if number is 0:
        return 'zero'
    elif number >= 1e12 or number < 0:
        raise AttributeError

    tokens = []
    tokens += _translate(number // 1_000_000_000, ' billion')
    number %= 1_000_000_000
    tokens += _translate(number // 1_000_000, ' million')
    number %= 1_000_000
    tokens += _translate(number // 1_000, ' thousand')
    number %= 1_000
    tokens += _translate(number)
    return _format(tokens)

def _format(tokens):
    if len(tokens) == 2:
        tokens.insert(-1, 'and')
    return ' '.join(tokens)

def _translate(number, postfix = ''):
    tokens = []

    if number >= 100:
        head = number // 100
        number %= 100
        tokens.append(f'{trans_table[head]} hundred')

    for tenth in tenth_table.keys():
        if number > tenth:
            digit = number - tenth
            tokens.append(f'{tenth_table[tenth]}-{trans_table[digit]}{postfix}')
            number = 0
            break

    if number is 0: # Ignore
        pass
    elif number in trans_table:
        tokens.append(trans_table[number] + postfix)
    else:
        raise Error(f'cant handle {number}')

    if len(tokens) > 1:
        tokens.insert(-1, 'and')
    return tokens
