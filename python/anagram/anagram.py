def _is_anagram(word, token):
    word = word.lower()
    token = token.lower()

    if word == token:
        return False

    return sorted(word) == sorted(token)

def detect_anagrams(word, tokens):
    return [token for token in tokens if _is_anagram(word, token)]
