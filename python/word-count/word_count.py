import re

def word_count(string):
    tokens = re.split('[_\W]', string.lower())
 
    dic = {}
    for token in tokens:
        if len(token) is 0:
            continue
        dic[token] = dic.get(token, 0) + 1

    return dic
