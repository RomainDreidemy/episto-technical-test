require_relative '../services/daily_cost_calculator'
require_relative '../helpers/days_between_dates'

class Option
  attr_reader :id, :rental_id, :type

  def initialize(id:, rental_id:, type:)
    @id = id
    @rental_id = rental_id
    @type = type
  end
end
