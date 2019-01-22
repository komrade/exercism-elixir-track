defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    ?a..?z |> Enum.to_list ==
      String.downcase(sentence)
      |> String.to_charlist
      |> Enum.filter(fn n -> Enum.member? ?a..?z, n end)
      |> Enum.uniq 
      |> Enum.sort
  end
end
