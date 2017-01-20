class BufferEmptyException(Exception):
    pass


class BufferFullException(Exception):
    pass


class CircularBuffer:
    def __init__(self, number):
        self.size = number
        self.buffer = []

    def read(self):
        if not self.buffer:
            raise BufferEmptyException

        return self.buffer.pop(0)

    def write(self, item):
        if self._is_full():
            raise BufferFullException

        self.buffer.append(item)

    def overwrite(self, item):
        if self._is_full():
            self.read()
        self.write(item)

    def clear(self):
        self.buffer = []

    def _is_full(self):
        return len(self.buffer) == self.size
