NORTH = 0
EAST = 1
SOUTH = 2
WEST = 3

class Robot:
    def __init__(self, direction = NORTH, x = 0, y = 0):
        self.x = x
        self.y = y
        self.bearing = direction
        self.command_map = {
            'L': self.turn_left,
            'R': self.turn_right,
            'A': self.advance
        }
        self.moving_map = {
            NORTH: lambda: self._moving(0, 1),
            EAST: lambda: self._moving(1, 0),
            SOUTH: lambda: self._moving(0, -1),
            WEST: lambda: self._moving(-1, 0)
        }

    @property
    def coordinates(self):
        return self.x, self.y

    def simulate(self, code):
        cmds = list(code)
        for cmd in cmds:
            self.command_map[cmd]()

    def _moving(self, dx, dy):
        self.x += dx
        self.y += dy

    def turn_right(self):
        self.bearing = (self.bearing + 1) % 4

    def turn_left(self):
        self.bearing = (self.bearing - 1) % 4

    def advance(self):
        self.moving_map[self.bearing]()
