defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    sorted_values = Enum.sort_by(values, &(-&1))
    deep_search(amount, sorted_values, %{})
  end

  def broad_search(-1, _amount, _coins, _changes), do: :error
  def broad_search(coin_num, 0, [coin], changes) do
    updated_change = Map.put(changes, coin, coin_num)
    {:ok, updated_change}
  end
  def broad_search(coin_num, amount, [coin | rest], changes) do
    updated_change = Map.put(changes, coin, coin_num)
    result = deep_search(amount, rest, updated_change)
    if result != :error do
      result
    else
      broad_search(coin_num - 1, amount + coin, [coin | rest], changes)
    end
  end

  def deep_search(_amount, [], _changes), do: :error
  def deep_search(amount, [coin|rest], changes) do
    max_coin_num = div(amount, coin)
    remained_coin = rem(amount, coin)

    broad_search(max_coin_num, remained_coin, [coin|rest], changes)
  end
end
