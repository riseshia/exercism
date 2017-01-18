class School:
    def __init__(self, school_name):
        self.school_name = school_name
        self.students = {}

    def add(self, name, grade):
        self._students_in_grade(grade).append(name)

    def grade(self, number):
        return set(self._students_in_grade(number))

    def sort(self):
        return [(g, tuple(sorted(s))) for g, s in self.students.items()]

    def _students_in_grade(self, grade):
        if grade not in self.students:
            self.students[grade] = []

        return self.students[grade]
