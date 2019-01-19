defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sanitize(sentence)
    |> String.split
    |> Enum.reduce %{}, 
      fn(word, acc) -> 
        Map.update(acc, word, 1, &(&1 + 1)) 
      end
  end

  def sanitize(line) do
    String.downcase(line)
    |> String.replace("_", " ")
    |> String.replace(~r/[,:!&@$%^]+/, "")
  end
end
