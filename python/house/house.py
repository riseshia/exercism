head_phrases = [
    'This is the house that Jack built.',
    'This is the malt',
    'This is the rat',
    'This is the cat',
    'This is the dog',
    'This is the cow with the crumpled horn',
    'This is the maiden all forlorn',
    'This is the man all tattered and torn',
    'This is the priest all shaven and shorn',
    'This is the rooster that crowed in the morn',
    'This is the farmer sowing his corn',
    'This is the horse and the hound and the horn',
]
repeat_phrases = [
    'that belonged to the farmer sowing his corn',
    'that kept the rooster that crowed in the morn',
    'that woke the priest all shaven and shorn',
    'that married the man all tattered and torn',
    'that kissed the maiden all forlorn',
    'that milked the cow with the crumpled horn',
    'that tossed the dog',
    'that worried the cat',
    'that killed the rat',
    'that ate the malt',
    'that lay in the house that Jack built.',
]

def verse(number):
    phrases = []
    phrases.append(head_phrases[number])
    if number > 0:
        phrases += repeat_phrases[-number:]

    return '\n'.join(phrases)


def rhyme():
    return '\n\n'.join(verse(i) for i in range(0, 12))
