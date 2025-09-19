require_relative '../../helpers/days_between_dates'
require_relative 'base_option'
require_relative '../../config/option_pricing_config'

class GpsOption < BaseOption
  include DaysBetweenDates

  def initialize(id:, rental_id:)
    super(
      id: id,
      rental_id:,
      type: 'gps',
      debited_party: 'driver',
      credited_party: 'owner'
    )
  end

  def compute_amount
    rental_days = nb_of_days(@rental.start_date, @rental.end_date)
    rental_days * OptionPricingConfig.instance.gps_daily_price
  end
end