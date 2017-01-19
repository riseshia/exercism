def _double_if(value, condition):
    if not condition:
        return value

    doubled = value * 2
    if doubled > 9:
        doubled -= 9
    return doubled

class Luhn:
    def __init__(self, number):
        self.number = number

    def addends(self):
        digits = [int(d) for d in str(self.number)]
        shifter = len(digits) % 2 + 1

        return [_double_if(d, (idx + shifter) % 2) for idx, d in enumerate(digits)]

    def checksum(self):
        return sum(self.addends())

    def is_valid(self):
        return not self.checksum() % 10

    def create(number):
        l = Luhn(number * 10)
        last_digit = -l.checksum() % 10
        return number * 10 + last_digit
