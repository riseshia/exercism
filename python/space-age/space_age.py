class SpaceAge:
    EARTH_SECOND = 365.25 * 24 * 60 * 60
    table = {
        'on_earth': 1,
        'on_mercury': 0.2408467,
        'on_venus': 0.61519726,
        'on_mars': 1.8808158,
        'on_jupiter': 11.862615,
        'on_saturn': 29.447498,
        'on_uranus': 84.016846,
        'on_neptune': 164.79132,
    }

    def __init__(self, seconds):
        self.seconds = seconds
        self.seconds_on_earth = seconds / self.EARTH_SECOND

    def __getattr__(self, name):
        if name in self.table:
            return lambda: round(self.seconds_on_earth / self.table[name], 2)
