import re

SUBLIST = 'sublist'
SUPERLIST = 'superlist'
EQUAL = 'equal'
UNEQUAL = 'unequal'

def check_lists(list_a, list_b):
    if list_a == list_b:
        return EQUAL

    s_a = _to_str(list_a)
    s_b = _to_str(list_b)

    if len(s_a) <= len(s_b) and re.search(s_a, s_b):
        return SUBLIST
    elif len(s_a) >= len(s_b) and re.search(s_b, s_a):
        return SUPERLIST
    else:
        return UNEQUAL

def _to_str(l):
    return ''.join(str(n) for n in l)
