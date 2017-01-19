def transform(old):
    return {item.lower(): n
            for n, items in old.items()
            for item in items}
