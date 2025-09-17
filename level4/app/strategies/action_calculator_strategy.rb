class ActionCalculatorStrategy
  def initialize(rental)
    @rental = rental
  end

  def calculate(dependency_actions = {})
    {
      who:,
      type:,
      amount: calculate_amount(dependency_actions)
    }
  end

  def who
    raise NotImplementedError, 'Subclasses must implement who method'
  end

  def type
    raise NotImplementedError, 'Subclasses must implement type method'
  end

  def calculate_amount(dependency_actions = {})
    raise NotImplementedError, 'Subclasses must implement calculate_amount method'
  end
end
