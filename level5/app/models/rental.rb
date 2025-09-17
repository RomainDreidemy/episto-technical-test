require_relative '../services/daily_cost_calculator'
require_relative '../helpers/days_between_dates'

class Rental
  include DaysBetweenDates

  attr_reader :id, :car, :start_date, :end_date, :distance, :options

  def initialize(id:, car:, start_date:, end_date:, distance:, options: [])
    @id = id
    @car = car
    @start_date = start_date
    @end_date = end_date
    @distance = distance
    @options = options
  end
end
