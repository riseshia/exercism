class Sieve
  attr_accessor :primes

  def initialize(limit)
    self.primes = generate_primes(limit)
  end

  private
  
  def generate_primes(limit)
    return [] if limit < 2

    primes = []
    candidates = (2..limit).to_a

    loop do
      next_prime = candidates.shift
      primes << next_prime
      candidates = reject_candidates(candidates, next_prime)

      break if next_prime > last_num_to_be_judged(limit)
    end
    primes + candidates
  end

  def reject_candidates(candidates, prime)
    candidates.reject { |number| number % prime == 0 }
  end

  def last_num_to_be_judged(limit)
    Math.sqrt(limit).to_i
  end
end
