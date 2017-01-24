class TriangleError(ValueError):
    pass


class Triangle:
    def __init__(self, a, b, c):
        Triangle._assert_vertex(a, b, c)
        equal_vs = len(set([a, b, c]))

        if equal_vs == 1:
            self._kind = 'equilateral'
        elif equal_vs == 2:
            self._kind = 'isosceles'
        else:
            self._kind = 'scalene'

    def kind(self):
        return self._kind

    def _assert_vertex(*vs):
        for v in vs:
            if v <= 0:
                raise TriangleError('this vertex is not valid')

        a, b, c = sorted(vs)
        if a + b <= c:
            raise TriangleError('these vertex cannot make triangle')
