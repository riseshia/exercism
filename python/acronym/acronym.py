import re

def abbreviate(long_phrase):
    actual_name = long_phrase.split(':')[0]
    return ''.join(re.findall('[A-Z]|(?<=[\s-])[a-z]', actual_name)).upper()
