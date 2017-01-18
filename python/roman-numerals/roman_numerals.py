trans_table = {
   1000: 'M',
    900: 'CM',
    500: 'D',
    400: 'CD',
    100: 'C',
    90: 'XC',
    50: 'L',
    40: 'XL',
    10: 'X',
    9: 'IX',
    5: 'V',
    4: 'IV',
    1: 'I',
}

def numeral(arabic):
    numerals = ''

    for num in trans_table.keys():
        if num <= arabic:
            times, arabic = divmod(arabic, num)
            numerals += trans_table[num] * times

    return numerals
