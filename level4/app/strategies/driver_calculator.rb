require_relative 'action_calculator_strategy'

class DriverCalculator < ActionCalculatorStrategy
  def who
    'driver'
  end

  def type
    'debit'
  end

  def calculate_amount(_ = nil)
    daily_cost = DailyCostCalculator.new(
      @rental.start_date,
      @rental.end_date,
      @rental.car.price_per_day
    ).calculate

    distance_cost = @rental.car.price_per_km * @rental.distance

    (daily_cost + distance_cost).to_i
  end
end