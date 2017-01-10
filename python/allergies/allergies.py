allergic_items = [
    'eggs', 'peanuts', 'shellfish', 'strawberries',
    'tomatoes', 'chocolate', 'pollen', 'cats'
]

class Allergies:
    def __init__(self, score):
        ais = allergic_items
        self.lst = [ais[idx] for idx in range(0, len(ais)) if 2 ** idx & score]

    def is_allergic_to(self, item):
        return item in self.lst
