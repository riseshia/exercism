require "ostruct"

class Palindromes
  attr_reader :smallest, :largest

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    palindromes = palindrome_products_dictionary.to_a.sort

    @smallest = return_val(*palindromes.first)
    @largest = return_val(*palindromes.last)
  end

  private

  def palindrome_products_dictionary
    palindrome_products.each_with_object({}) do |(a, b), dic|
      dic[a * b] ||= []
      dic[a * b] << [a, b]
    end
  end

  def palindrome_products
    [].tap do |products|
      @min_factor.upto(@max_factor) do |a|
        a.upto(@max_factor) do |b|
          products << [a, b] if palindrome?(a * b)
        end
      end
    end
  end

  def palindrome?(value)
    digits = value.digits
    digits == digits.reverse
  end

  def return_val(value, factors)
    OpenStruct.new(value: value, factors: factors)
  end
end
