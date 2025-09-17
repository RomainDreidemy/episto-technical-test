require_relative '../factories/action_calculator_factory'

class RentalActionsCalculator
  # The orders of the actors is important
  # because some actions depend on previous ones
  # (e.g. drivy action depends on insurance and assistance actions)
  ACTORS = %w[driver owner insurance assistance drivy].freeze

  def initialize(rental)
    @rental = rental
  end

  def calculate(options = {})
    ACTORS.reduce({}) do |actions, who|
      actions[who.to_sym] = ActionCalculatorFactory.create(who, @rental)
                                                   .calculate(actions, options)
      actions
    end
  end
end