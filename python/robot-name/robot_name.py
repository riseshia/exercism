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

        return ''.join(random.choices(ascii_uppercase, k=2)) \
               + '{:3d}'.format(random.randint(0,999))
