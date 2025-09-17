require_relative '../services/daily_cost_calculator'

class Rental
  attr_reader :id, :car, :start_date, :end_date, :distance

  def initialize(id:, car:, start_date:, end_date:, distance:)
    @id = id
    @car = car
    @start_date = start_date
    @end_date = end_date
    @distance = distance
  end

  def price
    daily_cost + distance_cost
  end

  private

  def daily_cost
    DailyCostCalculator.new(
      start_date,
      end_date,
      car.price_per_day
    ).calculate
  end

  def distance_cost
    car.price_per_km * distance
  end
end
