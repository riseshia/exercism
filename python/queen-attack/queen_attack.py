class Queen:
    def __init__(self, pos, label = None):
        (y, x) = pos
        self.y = y
        self.x = x
        self.label = label
        self._assert_queen()
        
    def _assert_queen(self):
        if not (-1 < self.x < 8 and -1 < self.y < 8):
            raise ValueError('queen should be on board')

    def can_attack(self, other):
        if self.y == other.y or self.x == other.x:
            return True
        elif abs(self.y - other.y) == abs(self.x - other.x):
            return True
        else:
            return False

class Board:
    def __init__(self):
        self.board = [list('________') for _ in range(8)]

    def place(self, q):
        if self.board[q.y][q.x] == '_':
            self.board[q.y][q.x] = q.label
        else:
            raise ValueError('queens could not be placed on same place')

    def to_str(self):
        return [''.join(row) for row in self.board]


def board(white_pos, black_pos):
    white_queen = Queen(white_pos, 'W')
    black_queen = Queen(black_pos, 'B')
    base = Board()

    base.place(white_queen)
    base.place(black_queen)
    return base.to_str()


def can_attack(queen1_pos, queen2_pos):
    q1 = Queen(queen1_pos)
    q2 = Queen(queen2_pos)
    base = Board()

    base.place(q1)
    base.place(q2)
    return q1.can_attack(q2)
