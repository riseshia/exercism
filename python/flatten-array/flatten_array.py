def flatten(els):
    return _flatten(els)

def _flatten(el):
    l = []
    for el in el:
        if isinstance(el, (list, tuple)):
            l += _flatten(el)
        elif el is None:
            pass
        else:
            l.append(el)

    return l
