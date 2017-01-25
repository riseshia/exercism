# Please, do not use the built-in python functions like map, reduce, len, etc.
# that solve the same problems and try to solve it yourself instead.


def map_clone(function, xs):
    return [function(x) for x in xs]


def length(xs):
    count = 0
    for x in xs:
        count += 1
    return count


def filter_clone(function, xs):
    return [x for x in xs if function(x)]


def reverse(xs):
    l = []
    if not xs:
        return l

    for x in xs:
        l.insert(0, x)

    if isinstance(xs, list):
        return l
    elif isinstance(xs, tuple):
        return tuple(l)


def append(xs, y):
    return xs + [y]


def foldl(function, xs, acc):
    for x in xs:
        acc = function(acc, x)

    return acc


def foldr(function, xs, acc):
    for x in reverse(xs):
        acc = function(x, acc)

    return acc


def flat(xs):
    for i, x in enumerate(xs):
        if isinstance(x, list):
            return flat(xs[:i] + x + xs[i+1:])

    return xs

def concat(xs, ys):
    if not isinstance(xs, list):
        xs = []
    if not isinstance(ys, list):
        ys = []

    return xs + ys
