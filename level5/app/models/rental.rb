require_relative '../services/daily_cost_calculator'
require_relative '../helpers/days_between_dates'
require_relative '../services/rental_actions_calculator'

class Rental
  attr_reader :id, :car, :start_date, :end_date, :distance, :options, :actions

  def initialize(id:, car:, start_date:, end_date:, distance:, options: [])
    @id = id
    @car = car
    @start_date = start_date
    @end_date = end_date
    @distance = distance
    @options = options

    options.each do |option|
      option.rental = self
    end

    @actions = []
  end

  def compute
    RentalActionsCalculator.new(self).calculate
  end

  def add_action(action)
    @actions << action
  end
end
