require_relative 'option_calculator_strategy'
require_relative '../../helpers/days_between_dates'

class AdditionalInsuranceCalculator < OptionCalculatorStrategy
  include DaysBetweenDates

  def type
    'additional_insurance'
  end

  def credit
    'drivy'
  end

  def calculate_amount
    days = nb_of_days(@rental.start_date, @rental.end_date)

    days * 1000 # Additional insurance costs 10e (1000 cents) per day
  end
end