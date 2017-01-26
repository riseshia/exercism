def parse_binary(bin_str):
    acc = 0

    for d in bin_str:
        acc <<= 1
        if d in '1':
            acc += 1
        elif d in '0':
            pass
        else:
            raise ValueError('this is not valid binary string')

    return acc
