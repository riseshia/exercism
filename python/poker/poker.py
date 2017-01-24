class Score:
    def __init__(self, priority = 0, score = 0):
        self.score = score
        self.priority = priority

    def __gt__(self, other):
        if self.priority > other.priority:
            return True
        elif self.priority == other.priority:
            return self.score > other.score
        else:
            return False

    def __eq__(self, other):
        return self.priority == other.priority and self.score == other.score


class Hand:
    order = ['nothing', 'one_pair', 'two_pair', 'three_pair',
             'straight', 'flush', 'full', 'square', 'straight_flush']

    def __init__(self, hand):
        self.hand = hand
        self._parse()

    def score(self):
        return self.straight_flush() \
               or self.square() \
               or self.full() \
               or self.flush() \
               or self.straight() \
               or self.three_pair() \
               or self.pair() \
               or Score(self._priority('nothing'), 0)

    def _priority(self, name):
        return self.order.index(name)

    def straight_flush(self):
        score = self.straight()
        if score and self.flush():
            return Score(self._priority('straight_flush'), score.score)

    def square(self):
        for idx, count in enumerate(self.count_of_orders):
            if count == 4:
                return Score(self._priority('square'), idx + 1)

    def full(self):
        *_, a, b = sorted(self.count_of_orders)
        if a != 2 or b != 3:
            return None

        for idx, count in enumerate(self.count_of_orders):
            if count == 3:
                return Score(self._priority('full'), idx + 1)

    def flush(self):
        for shapes in self.oxs_table:
            if sum(shapes) == 5:
                score = max(int(num) for num, shp in self.hand)
                return Score(self._priority('flush'), score)

    def straight(self):
        if len(set(self.count_of_orders)) != 2:
            return None

        idx = str(self.count_of_orders).find('1, 1, 1, 1, 1')
        if idx != -1:
            return Score(self._priority('straight'), idx + 6)


    def three_pair(self):
        for idx, count in enumerate(self.count_of_orders):
            if count == 3:
                return Score(self._priority('three_pair'), idx + 1)

    def pair(self):
        l = [
            idx + 1 
            for idx, count in enumerate(self.count_of_orders)
            if count == 2
        ]

        num_of_pair = len(l)
        if num_of_pair == 2: 
            return Score(self._priority('two_pair'), max(l))
        elif num_of_pair == 1: 
            return Score(self._priority('one_pair'), l[0])

    def _parse(self):
        shapes = list('HDSC')
        orders = list('23456789TJQKA')
        
        sxo_table = [[0] * len(shapes) for _ in orders]
        oxs_table = [[0] * len(orders) for _ in shapes]
        
        for o, s in self.hand:
            o_i = orders.index(o)
            s_i = shapes.index(s)
            sxo_table[o_i][s_i] += 1
            oxs_table[s_i][o_i] += 1

        self.sxo_table = sxo_table
        self.oxs_table = oxs_table

        self.count_of_orders = [ 
            sum(orders)
            for idx, orders in enumerate(self.sxo_table)
        ]

def poker(hands):
    highest_score = Score()
    highest_hands = []
    for cards in hands:
        hand = Hand(cards)
        score = hand.score()
        if score > highest_score:
            highest_score = score
            highest_hands = [cards]
        elif score == highest_score:
            highest_hands.append(cards)

    return highest_hands
