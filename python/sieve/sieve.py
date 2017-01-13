def _is_prime(n, primes):
    for p in primes:
        if n % p == 0:
            return False
    return True

def sieve(number):
    primes = []
    candidates = [2] + list(range(3, number + 1, 2))

    for n in candidates:
        if _is_prime(n, primes):
            primes.append(n)

    return primes
