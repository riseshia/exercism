def prime_factors(number):
    l = []
    p = 2 
    while number != 1:
        quo, rem = divmod(number, p)
        if rem == 0:
            number = quo
            l.append(p)
        else:
            p += 1

    return l
