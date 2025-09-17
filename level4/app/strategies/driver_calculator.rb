require_relative 'action_calculator_strategy'

class DriverCalculator < ActionCalculatorStrategy
  def who
    'driver'
  end

  def type
    'debit'
  end

  def calculate_amount(_ = nil)
    @rental.price # The driver pays the total rental price
  end
end