ord_of = ['', 'first', 'second', 'third', 'fourth', 'fifth', 'sixth',
          'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth']
phrases = [
    "twelve Drummers Drumming, ",
    "eleven Pipers Piping, ",
    "ten Lords-a-Leaping, ",
    "nine Ladies Dancing, ",
    "eight Maids-a-Milking, ",
    "seven Swans-a-Swimming, ",
    "six Geese-a-Laying, ",
    "five Gold Rings, ",
    "four Calling Birds, ",
    "three French Hens, ",
    "two Turtle Doves, ",
    "a Partridge in a Pear Tree.",
]


def pick_body(n):
    *heads, last = phrases[-n:]

    if len(heads) > 0:
        return ''.join(heads) + 'and ' + last
    else:
        return last


def verse(num):
    return \
        f"On the {ord_of[num]} day of Christmas my true love gave to me, " \
        + pick_body(num) \
        + '\n'


def verses(start, end):
    return '\n'.join(verse(n) for n in range(start, end + 1)) + '\n'


def sing():
    return verses(1, 12)
