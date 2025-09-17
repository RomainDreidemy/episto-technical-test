class ActionCalculatorStrategy
  def initialize(rental)
    @rental = rental
  end

  def calculate(dependency_actions = {}, options = {})
    {
      who:,
      type:,
      amount_without_options: calculate_amount_without_options(dependency_actions, options),
      amount: calculate_amount_without_options_with_options(dependency_actions, options)
    }
  end

  def who
    raise NotImplementedError, 'Subclasses must implement who method'
  end

  def type
    raise NotImplementedError, 'Subclasses must implement type method'
  end

  def calculate_amount_without_options(dependency_actions = {}, options = {})
    raise NotImplementedError, 'Subclasses must implement calculate_amount_without_options method'
  end

  private

  def calculate_amount_without_options_with_options(dependency_actions = {}, options = {})
    calculate_amount_without_options(dependency_actions, options) + option_amount(options)
  end

  def option_amount(options)
    options
      .values
      .filter { |option| option[:credit] == who }
      .sum { |option| option[:amount] }
  end
end
