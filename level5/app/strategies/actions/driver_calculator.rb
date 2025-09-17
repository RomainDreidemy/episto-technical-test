require_relative 'action_calculator_strategy'

class DriverCalculator < ActionCalculatorStrategy
  def who
    'driver'
  end

  def type
    'debit'
  end

  def calculate_amount_without_options(_ = nil, options = {})
    daily_cost = DailyCostCalculator.new(
      @rental.start_date,
      @rental.end_date,
      @rental.car.price_per_day
    ).calculate

    distance_cost = @rental.car.price_per_km * @rental.distance

    (daily_cost + distance_cost).to_i
  end

  private def option_amount(options)
    options.values.sum { |option| option[:amount] }
  end
end