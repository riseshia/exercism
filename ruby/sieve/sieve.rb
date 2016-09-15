class Sieve
  attr_accessor :limit

  def initialize(limit)
    self.limit = limit
  end

  def primes
    return [] if limit < 2
    return [2] if limit == 2
    generate_primes
  end

  private
  
  def generate_primes
    (3..limit).each_with_object([2]) do |n, primes|
      primes << n if prime?(n, primes)
    end
  end

  def prime?(n, primes)
    primes.all? { |prime| n % prime != 0 } 
  end
end
