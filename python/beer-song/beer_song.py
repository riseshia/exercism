def verse(n):
    if n == 0:
        return \
            'No more bottles of beer on the wall, no more bottles of beer.\n' \
            'Go to the store and buy some more, ' \
            '99 bottles of beer on the wall.\n'
    elif n == 1:
        return \
            '1 bottle of beer on the wall, 1 bottle of beer.\n' \
            'Take it down and pass it around, ' \
            'no more bottles of beer on the wall.\n'
    elif n == 2:
        return \
            '2 bottles of beer on the wall, 2 bottles of beer.\n' \
            'Take one down and pass it around, 1 bottle of beer on the wall.\n'
    else:
        return \
            f'{n} bottles of beer on the wall, {n} bottles of beer.\n' \
            f'Take one down and pass it around, ' \
            f'{n-1} bottles of beer on the wall.\n'


def song(start, end = 0):
    return '\n'.join(verse(i) for i in range(start, end - 1, -1)) + '\n'
