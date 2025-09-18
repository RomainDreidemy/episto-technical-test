require_relative '../services/daily_cost_calculator'
require_relative '../helpers/days_between_dates'
require_relative '../services/rental_computation'

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

  # @return [ComputedRental]
  def compute
    RentalComputation.new(self).compute
  end
end
