defmodule FreelancerRates do
  @hourly_to_daily_factor 8.0
  @working_days_month 22
  def daily_rate(hourly_rate) do
    hourly_rate*@hourly_to_daily_factor
  end

  def apply_discount(before_discount, discount) do
    discounted_price = before_discount*discount/100.0
    before_discount-discounted_price
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(daily_rate(hourly_rate, discount)*@working_days_month)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate = daily_rate(hourly_rate, discount)
    Float.floor(budget/daily_rate, 1)
  end

  defp daily_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
  end
end
