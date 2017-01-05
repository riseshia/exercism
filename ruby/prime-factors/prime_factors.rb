module PrimeFactors
  module_function

  def for(number)
    divider = 2

    [].tap do |primes|
      begin
        if number % divider == 0
          primes << divider
          number /= divider
        else
          divider += 1
        end
      end until number == 1
    end
  end
end
