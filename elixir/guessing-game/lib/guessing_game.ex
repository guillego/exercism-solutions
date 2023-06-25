defmodule GuessingGame do
  def compare(secret_number, :no_guess) do
    compare(secret_number)
  end

  def compare(secret_number, guess) when secret_number == guess do
    "Correct"
  end

  def compare(secret_number, guess) when guess + 1 == secret_number or guess - 1 == secret_number do
    "So close"
  end

  def compare(secret_number, guess) when guess > secret_number do
    "Too high"
  end

  def compare(secret_number, guess) when guess < secret_number do
    "Too low"
  end


  def compare(secret_number) do
    "Make a guess"
  end
end
