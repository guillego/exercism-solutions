defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({num_a, den_a} = _a, {num_b, den_b} = _b) do
    num_sum = num_a*den_b + num_b*den_a
    common_den = den_a*den_b

    reduce({num_sum, common_den})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({num_a, den_a} = _a, {num_b, den_b} = _b) do
    num_sub = num_a*den_b - num_b*den_a
    common_den = den_a*den_b

    reduce({num_sub, common_den})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({num_a, den_a} = _a, {num_b, den_b} = _b) do
    reduce({num_a*num_b, den_a*den_b})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({num_a, den_a} = _a, {num_b, den_b} = _b) do
    reduce({num_a*den_b, den_a*num_b})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num, den} = _a) do
    reduce({Kernel.abs(num), Kernel.abs(den)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(_a, 0 = _n) do
    {1, 1}
  end

  def pow_rational({num, den} = _a, n) when n > 0 do
    pow_num = round(:math.pow(num,n))
    pow_den = round(:math.pow(den,n))
    reduce({pow_num, pow_den})
  end

  def pow_rational({num, den} = _a, n) when n < 0 do
    abs_n = Kernel.abs(n)
    pow_num = round(:math.pow(num,abs_n))
    pow_den = round(:math.pow(den,abs_n))
    reduce({pow_den, pow_num})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {num, den} = _n) do
    :math.pow(:math.pow(x, num), 1/den)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({num, den} = _a) do
    gcd = Integer.gcd(Kernel.abs(num), Kernel.abs(den))
    cond do
      den > 0 -> {div(num, gcd), div(den, gcd)}
      true ->  {-1*div(num, gcd), -1*div(den, gcd)}
    end
  end
end
