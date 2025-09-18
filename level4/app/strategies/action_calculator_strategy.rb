require_relative '../models/action'

class ActionCalculatorStrategy
  def initialize(rental)
    @rental = rental
  end

  def calculate(dependency_actions = {})
    Action.new(
      who:,
      type:,
      amount: calculate_amount(dependency_actions)
    )
  end

  def who
    raise NotImplementedError, 'Subclasses must implement who method'
  end

  def type
    raise NotImplementedError, 'Subclasses must implement type method'
  end

  def calculate_amount(dependency_actions = {}, options = {})
    raise NotImplementedError, 'Subclasses must implement calculate_amount_without_options method'
  end
end
