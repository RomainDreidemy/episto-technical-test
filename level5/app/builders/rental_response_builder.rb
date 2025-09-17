require_relative '../services/rental_options_calculator'
require_relative '../services/rental_actions_calculator'

class RentalResponseBuilder
  def initialize(rental)
    @rental = rental
  end

  def build
    self.calculate_options
        .calculate_actions
        .build_response
  end

  def calculate_options
    @options = RentalOptionsCalculator.new(@rental).calculate
    self
  end

  def calculate_actions
    @actions = RentalActionsCalculator.new(@rental).calculate(@options)
    self
  end

  def build_response
    {
      id: @rental.id,
      actions: format_actions,
      options: format_options
    }
  end

  def format_actions
    @actions.values.map do |action|
      {
        who: action[:who],
        type: action[:type],
        amount: action[:amount]
      }
    end
  end

  def format_options
    @rental.options.map(&:type)
  end
end
