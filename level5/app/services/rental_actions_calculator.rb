require_relative '../factories/action_factory'

class RentalActionsCalculator
  # The orders of the actors is important
  # because some actions depend on previous ones
  # (e.g. drivy action depends on insurance and assistance actions)
  ACTORS = %w[driver owner insurance assistance drivy].freeze

  def initialize(rental)
    @rental = rental
  end

  def calculate
    ACTORS.each do |who|
      action = ActionFactory.create(who, @rental)
      action.calculate

      @rental.add_action(action)
    end
  end
end