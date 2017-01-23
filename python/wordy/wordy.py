import re

operaters = {
    'plus': lambda x,y: x + y,
    'minus': lambda x,y: x - y,
    'multiplied by': lambda x,y: x * y,
    'divided by': lambda x,y: x // y,
}
op_regex = '|'.join(operaters.keys())

def calculate(question):
    matched = re.match(f'^What is (-?\d+) ({op_regex}) (-?\d+)([^?]*)\?$', question)
    if not matched:
        raise ValueError('it is not valid question')

    num1, oper, num2, extra = matched.groups()

    num1 = int(num1) 
    num2 = int(num2) 
    result = operaters[oper](num1, num2)

    if extra:
        return calculate(f'What is {result}{extra}?')
    else:
        return result
