defmodule RNATranscription do
  @paired_rna %{?A => ?U, ?C => ?G, ?T => ?A, ?G => ?C}

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna([]), do: []
  def to_rna([head | rest]), do: [@paired_rna[head] | to_rna(rest)]
end
