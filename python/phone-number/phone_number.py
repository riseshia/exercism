import re


class Phone:
    def __init__(self, phone_number):
        area, mid, tail = Phone._parse(phone_number)
        self.area = area
        self.mid = mid
        self.tail = tail

    def _parse(number):
        matched = re.match('^1?\D*(\d{3})\D*(\d{3})\D*(\d{4})$', number)
        if matched:
            return matched.groups()
        else:
            return ('000', '000', '0000')

    def area_code(self):
        return self.area

    def pretty(self):
        return f'({self.area}) {self.mid}-{self.tail}'

    @property
    def number(self):
        return f'{self.area}{self.mid}{self.tail}'
