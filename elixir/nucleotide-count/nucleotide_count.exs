defmodule NucleotideCount do
  @nucleotides 'ATCG'
  @default_histogram %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, target) when target in @nucleotides do
    strand
    |> Enum.map(&(dna?(&1)))
    |> Enum.count(fn(nucleotide) -> nucleotide == target end)
  end
  def count(_strand, target) do
    raise ArgumentError, message: "#{target} is not a valid nucleotide"
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    strand
    |> Enum.map(&(dna?(&1)))
    |> Enum.reduce(@default_histogram, fn(nucleotide, his) ->
      Map.put(his, nucleotide, count(strand, nucleotide))
    end)
  end

  @spec dna?(char) :: char
  defp dna?(nucleotide) when nucleotide in @nucleotides, do: nucleotide
  defp dna?(nucleotide) do
    raise ArgumentError, message: "#{target} is not a valid nucleotide"
  end
end
