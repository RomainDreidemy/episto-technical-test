require_relative '../../helpers/days_between_dates'
require_relative 'base_option'
require_relative '../../config/option_pricing_config'

class AdditionalInsuranceOption < BaseOption
  include DaysBetweenDates

  def initialize(id:, rental_id:)
    super(
      id: id,
      rental_id:,
      type: 'additional_insurance',
      debited_party: 'driver',
      credited_party: 'drivy'
    )
  end

  def compute_amount
    rental_days = nb_of_days(@rental.start_date, @rental.end_date)
    OptionPricingConfig.instance.additional_insurance_daily_price * rental_days
  end
end