defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    rem400 = rem(year, 400)
    rem100 = rem(year, 100)
    rem4 = rem(year, 4)

    cond do
      rem400 == 0 -> true
      rem100 == 0 -> false
      rem4 == 0 -> true
      true -> false
    end

  end
end
