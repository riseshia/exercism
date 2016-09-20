module Prime
  class << self
    def nth(number)
      raise ArgumentError, "Argument should be greater than 0" if number < 1

      primes = [2, 3]
      loop do
        primes << find_next_prime(primes) 
        return primes[number - 1] if primes.size >= number
      end
    end

    private
    
    def find_next_prime(primes) 
      next_number = primes.last
      loop do
        next_number += 2
        prime_check = !primes.any? do |prime|
          next_number % prime == 0
        end

        return next_number if prime_check
      end
    end
  end
end

