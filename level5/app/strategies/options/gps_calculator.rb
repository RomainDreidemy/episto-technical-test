require_relative 'option_calculator_strategy'
require_relative '../../helpers/days_between_dates'

class GpsCalculator < OptionCalculatorStrategy
  include DaysBetweenDates

  def type
    'gps'
  end

  def credit
    'owner'
  end

  def calculate_amount
    days = nb_of_days(@rental.start_date, @rental.end_date)

    days * 500 # GPS costs 5e (500 cents) per day
  end
end