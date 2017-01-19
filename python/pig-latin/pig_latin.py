normal_trans = ['a', 'e', 'i', 'o', 'u', 'xr', 'yt']
edge_trans = {
    'qu': lambda x: x[2:] + x[0:2],
    '': lambda x: x[1:] + x[0],
}

def translate_word(word):
    if any([word.startswith(x) for x in normal_trans]):
        return word + "ay"

    for prefix, func in edge_trans.items():
        if word.startswith(prefix):
            return translate_word(func(word))


def translate(sentence):
    return ' '.join(translate_word(word) for word in sentence.split(' '))
