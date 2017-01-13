def sieve(number):
    primes = []
    candidates = range(2, number + 1)

    while len(candidates) > 0:
        prime = candidates[0]
        primes.append(prime)
        candidates = [n for n in candidates[1:] if n % prime != 0]

    return primes
