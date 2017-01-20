class Matrix:
    def __init__(self, string):
        self.rows = self._parse(string)
        self.columns = self._transform(self.rows)

    def _parse(self, string):
        rows = string.split('\n')
        return [list(map(int, row.split(' '))) for row in rows]

    def _transform(self, rows):
        size = len(rows[0])
        return [[r[i] for r in rows] for i in range(size)]
