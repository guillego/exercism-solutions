defmodule Lasagna do
  def expected_minutes_in_oven do
    40
  end

  def remaining_minutes_in_oven(elapsed_minutes) do
    remaining = expected_minutes_in_oven() - elapsed_minutes
    if remaining < 0 do
      0
    else
      remaining
    end
  end

  def preparation_time_in_minutes(n_layers) do
  minutes_per_layer = 2

  n_layers * minutes_per_layer
  end

  def total_time_in_minutes(n_layers, elapsed_minutes) do
  preparation_time_in_minutes(n_layers) + elapsed_minutes
  end

  # Please define the 'alarm/0' function
  def alarm do
  "Ding!"
  end
end
