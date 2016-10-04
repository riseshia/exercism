defmodule Prime do
  @first_prime 2
  @start_number 2

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count < 1, do: raise "Give me positive integer!"
  def nth(count) do
    find_prime([], @start_number, count)
  end

  defp find_prime([target | _], _, 0), do: target
  defp find_prime([], @first_prime, remained_count) do
    find_prime([@first_prime], @first_prime + 1, remained_count - 1)
  end
  defp find_prime(primes, number, remained_count) do
    if prime?(primes, number) do
      find_prime([number | primes], number + 2, remained_count - 1)
    else
      find_prime(primes, number + 2, remained_count)
    end
  end

  defp prime?(primes, number) do
    primes |> Enum.all?(&(rem(number, &1) != 0))
  end
end
