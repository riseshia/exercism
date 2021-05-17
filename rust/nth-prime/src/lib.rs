pub fn nth(n: u32) -> u32 {
    let mut idx: u32 = 1;
    let mut primes: Vec<u32> = vec![2];
    let mut candidate: u32 = 1; // start from 3

    loop {
        if idx > n {
            break
        } else {
            candidate += 2;
        }

        if is_prime(candidate, &primes) {
            primes.push(candidate);
            idx += 1;
        }
    };

    primes[n as usize]
}

fn is_prime(n: u32, primes: &[u32]) -> bool {
    for prime in primes.iter() {
        if n % prime == 0 {
            return false
        }
    }
    true
}
