require_relative 'base_action'
require_relative '../../services/daily_cost_calculator'
require_relative 'debit_action'

class DriverAction < DebitAction
  def initialize(rental:)
    super(
      rental:,
      who: 'driver'
    )
  end

  def calculate_amount_without_options
    daily_cost = DailyCostCalculator.new(
      @rental.start_date,
      @rental.end_date,
      @rental.car.price_per_day
    ).calculate

    distance_cost = @rental.car.price_per_km * @rental.distance

    (daily_cost + distance_cost).to_i
  end
end