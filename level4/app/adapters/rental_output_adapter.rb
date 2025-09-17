require_relative '../factories/action_calculator_factory'

class RentalResponseBuilder
  def initialize(rental)
    @rental = rental
  end

  def adapt
    actions = {}

    %w[driver owner insurance assistance].each do |who|
      actions[who.to_sym] = ActionCalculatorFactory.create(who, @rental)
                                                   .calculate
    end

    actions[:drivy] = ActionCalculatorFactory.create('drivy', @rental).calculate(actions)

    {
      id: @rental.id,
      actions: actions.values,
    }
  end
end
