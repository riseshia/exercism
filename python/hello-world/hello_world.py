#
# Skeleton file for the Python "Hello World" exercise.
#


def hello(name=''):
    if name == '' or name is None:
        name = 'World'

    return f'Hello, {name}!'
