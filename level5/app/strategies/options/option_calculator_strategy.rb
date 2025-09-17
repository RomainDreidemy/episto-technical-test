class OptionCalculatorStrategy
  def initialize(rental)
    @rental = rental
  end

  def calculate
    {
      type:,
      amount: calculate_amount,
      credit:,
    }
  end

  def type
    raise NotImplementedError, 'Subclasses must implement type method'
  end

  def calculate_amount
    raise NotImplementedError, 'Subclasses must implement calculate_amount method'
  end

  def credit
    raise NotImplementedError, 'Subclasses must implement credit method'
  end
end
