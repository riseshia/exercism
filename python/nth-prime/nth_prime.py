def _is_prime(primes, n):
    for x in primes:
        if n % x == 0:
            return False

    return True

def nth_prime(number):
    primes = [2]
    
    n = 3
    while len(primes) != number:
        if _is_prime(primes, n):
            primes.append(n)

        n += 2

    return primes[-1]
