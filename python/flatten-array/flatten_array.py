def flatten(lists):
    return _flatten(lists)

def _flatten(el):
    l = []
    for el in el:
        if isinstance(el, list):
            l += _flatten(el)
        elif isinstance(el, tuple) or el is None:
            pass
        else:
            l.append(el)

    return l
