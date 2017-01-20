import random
import time
from string import ascii_uppercase, digits


class Robot:
    def __init__(self):
        self.name = self._generate_name()

    def reset(self):
        self.name = self._generate_name()

    def _generate_name(self):
        random.seed(time.time())

        name = ''
        name += ascii_uppercase[random.randint(0, 25)]
        name += ascii_uppercase[random.randint(0, 25)]
        name += f'{random.randint(0,9)}'
        name += f'{random.randint(0,9)}'
        name += f'{random.randint(0,9)}'
        return name
