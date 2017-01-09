#
# Skeleton file for the Python "Bob" exercise.
#


def is_shouting(what):
    upper_case = what.upper()
    if upper_case == what.lower():
        return False
    elif upper_case != what:
        return False
    else:
        return True

def is_question(what):
    if what.endswith('?'):
        return True
    else:
        return False

def hey(what):
    what = what.strip()
    if what == '':
        return 'Fine. Be that way!'
    elif is_shouting(what):
        return 'Whoa, chill out!'
    elif what.endswith('?'):
        return 'Sure.'
    else:
        return 'Whatever.'
