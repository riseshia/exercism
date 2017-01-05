def is_pangram(s):
    return len(set([c for c in s.lower() if 'a' <= c <= 'z'])) == 26
