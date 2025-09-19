require_relative '../models/computed_rental'
require_relative '../factories/action_calculator_factory'
require_relative '../models/computed_rental'

class RentalComputation
  def initialize(rental)
    @rental = rental
  end

  # @return [ComputedRental]
  def compute
    actions = {}

    %w[driver owner insurance assistance drivy].each do |who|
      actions[who.to_sym] = ActionFactory.create(who, @rental)
                                         .calculate(actions)
    end

    ComputedRental.new(@rental, actions.values)
  end
end