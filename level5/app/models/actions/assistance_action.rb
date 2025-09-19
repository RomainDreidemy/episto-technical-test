require_relative 'credit_action'
require_relative '../../helpers/days_between_dates'
require_relative '../../config/commission_config'

class AssistanceAction < CreditAction
  include DaysBetweenDates

  def initialize(rental:)
    super(
      rental:,
      who: 'assistance'
    )
  end

  def calculate_amount_without_options
    nb_of_days(@rental.start_date, @rental.end_date) *
      CommissionConfig.instance.assistance_fee_per_day
  end
end