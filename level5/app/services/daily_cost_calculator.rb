require_relative '../helpers/days_between_dates'
require_relative '../config/daily_pricing_config'

class DailyCostCalculator
  include DaysBetweenDates

  def initialize(start_date, end_date, price_per_day)
    @start_date = start_date
    @end_date = end_date
    @price_per_day = price_per_day
  end

  def calculate
    total_days = nb_of_days(@start_date, @end_date)
    return 0 if total_days <= 0

    total_price = 0

    (1..total_days).each do |day|
      total_price += price_for_day(day)
    end

    total_price
  end

  private

  def price_for_day(day)
    discount = DailyPricingConfig.instance.discount(day)

    (@price_per_day * (1 - discount)).to_i
  end
end