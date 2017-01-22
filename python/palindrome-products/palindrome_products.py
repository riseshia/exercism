from itertools import combinations

def _is_palindrome(x):
    s = str(x)
    return s == s[::-1]


def _palindromes(max_f, min_f):
    rg = range(min_f, max_f + 1)
    return [(a * b, [a, b])
            for a in rg for b in rg
            if _is_palindrome(a * b)]


def smallest_palindrome(max_factor, min_factor = 0):
    return min(_palindromes(max_factor, min_factor))


def largest_palindrome(max_factor, min_factor = 0):
    return max(_palindromes(max_factor, min_factor))
