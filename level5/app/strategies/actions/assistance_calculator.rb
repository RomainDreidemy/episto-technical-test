require_relative 'action_calculator_strategy'
require_relative '../../helpers/days_between_dates'
require_relative '../../config/commission_config'

class AssistanceCalculator < ActionCalculatorStrategy
  include DaysBetweenDates

  def who
    'assistance'
  end

  def type
    'credit'
  end

  def calculate_amount_without_options(_ = nil, options = {})
    nb_of_days(@rental.start_date, @rental.end_date) *
      CommissionConfig.instance.assistance_fee_per_day # The assistance receives 1€ per day (100 cents)
  end
end
