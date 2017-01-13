def sieve(number):
    candidates = list(range(2, number + 1))
    primes = []

    while candidates:
        prime = candidates.pop(0)
        primes.append(prime)
        candidates = [n for n in candidates if n % prime != 0]

    return primes
