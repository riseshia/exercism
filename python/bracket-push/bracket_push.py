pair = {'}': '{', ')': '(', ']': '['}


def check_brackets(stream):
    stack = []

    for br in stream:
        if stack and pair.get(br, None) == stack[-1]:
            stack.pop()
        else:
            stack.append(br)

    if stack:
        return False
    else:
        return True
