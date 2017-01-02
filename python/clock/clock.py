class Clock:
    def __init__(self, hour, minute):
        self.__adjust(hour, minute)

    # Public method
    def add(self, minute):
        self.__adjust(self.hour, self.minute + minute)
        return self

    # Private method
    def __adjust(self, hour, minute):
        total_minute = hour * 60 + minute

        self.minute = total_minute % 60
        self.hour = (total_minute // 60) % 24

    # Override method
    def __str__(self):
        return '%0.2d:%0.2d' % (self.hour, self.minute)

    def __eq__(self, other):
        return str(self) == str(other)
