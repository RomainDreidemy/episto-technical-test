require_relative '../helpers/days_between_dates'

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

    total_price.to_i
  end

  private

  def price_for_day(day)
    case day
    when 1
      @price_per_day
    when 2..4
      @price_per_day * 0.9  # -10%
    when 5..10
      @price_per_day * 0.7  # -30%
    else
      @price_per_day * 0.5  # -50%
    end
  end
end