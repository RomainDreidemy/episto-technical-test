require_relative '../services/daily_cost_calculator'
require_relative '../helpers/days_between_dates'
require_relative 'commission'

class Rental
  include DaysBetweenDates

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

  def commission
    @commission ||= Commission.new(price:, rental_days: nb_of_days(@start_date, @end_date))
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
