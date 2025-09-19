require_relative '../../helpers/days_between_dates'
require_relative 'base_option'
require_relative '../../config/option_pricing_config'

class BabySeatOption < BaseOption
  include DaysBetweenDates

  def initialize(id:, rental_id:)
    super(
      id: id,
      rental_id:,
      type: 'baby_seat',
      debited_party: 'driver',
      credited_party: 'owner'
    )
  end

  def compute_amount
    days = nb_of_days(@rental.start_date, @rental.end_date)

    days * OptionPricingConfig.instance.baby_seat_daily_price
  end
end