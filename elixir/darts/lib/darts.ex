defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    rad = radius(x,y)
    cond do
      rad <= 1 -> 10
      rad <= 5 -> 5
      rad <= 10 -> 1
      true -> 0
    end
  end

  defp radius(x,y) do
    :math.sqrt(:math.pow(x,2) + :math.pow(y,2))
  end
end
