defmodule FoodChain do
  @doc """
  Generate consecutive verses of the song 'I Know an Old Lady Who Swallowed a Fly'.
  """
  @animals [
    fly: "I don't know why she swallowed the fly. Perhaps she'll die.\n",
    spider: "It wriggled and jiggled and tickled inside her.",
    bird: "How absurd to swallow a bird!",
    cat: "Imagine that, to swallow a cat!",
    dog: "What a hog, to swallow a dog!",
    goat: "Just opened her throat and swallowed a goat!",
    cow: "I don't know how she swallowed a cow!",
  ]
  @verse_animals %{
    1 => :fly,
    2 => :spider,
    3 => :bird,
    4 => :cat,
    5 => :dog,
    6 => :goat,
    7 => :cow,
    8 => :horse
  }

  defp verse(1) do
    """
    I know an old lady who swallowed a fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """
  end

  defp verse(8) do
    """
    I know an old lady who swallowed a horse.
    She's dead, of course!
    """
  end

  defp verse(n) when n > 1 do
    animal = @verse_animals[n]
    intro =
    """
    I know an old lady who swallowed a #{animal}.
    #{@animals[animal]}
    """

    reasons =
    n..2
    |> Enum.map(fn k -> reason(@verse_animals[k], @verse_animals[k-1]) end)

    verse = [intro | reasons]
    [verse | @animals[:fly]]
  end
  defp reason(:bird, :spider) do
    """
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    """
  end

  defp reason(animal1, animal2) do
    """
    She swallowed the #{animal1} to catch the #{animal2}.
    """
  end


  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, stop) do
    start..stop
    |> Enum.map(&verse(&1))
    |> Enum.join("\n")
  end
end
