children = [
    'Alice', 'Bob', 'Charlie', 'David',
    'Eve', 'Fred', 'Ginny', 'Harriet',
    'Ileana', 'Joseph', 'Kincaid', 'Larry']
plant = {
    'R': 'Radishes',
    'C': 'Clover',
    'G': 'Grass',
    'V': 'Violets'
}

class Garden:
    def __init__(self, locations, students=children):
        self.locations = locations.split('\n')
        self.students = students
        self.students.sort()

    def plants(self, name):
        idx = self.students.index(name) * 2
        return [plant[self.locations[y][x]] for (y, x) in self._pos(idx)]

    def _pos(self, idx):
        return [(0, idx), (0, idx + 1), (1, idx), (1, idx + 1)]
