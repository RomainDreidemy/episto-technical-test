require_relative 'option_calculator_strategy'
require_relative '../../helpers/days_between_dates'

class BabySeatCalculator < OptionCalculatorStrategy
  include DaysBetweenDates

  def type
    'baby_seat'
  end

  def credit
    'owner'
  end

  def calculate_amount
    days = nb_of_days(@rental.start_date, @rental.end_date)

    days * 200 # Baby seat costs 2e (200 cents) per day
  end
end