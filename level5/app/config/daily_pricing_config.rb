class DailyPricingConfig
  attr_reader :first_day_discount,
              :days_2_to_4_discount,
              :days_5_to_10_discount,
              :beyond_10_days_discount

  def initialize
    @first_day_discount = 0.0   # No discount for the first day
    @days_2_to_4_discount = 0.1  # 10% discount for days 2 to 4
    @days_5_to_10_discount = 0.3 # 30% discount for days 5 to 10
    @beyond_10_days_discount = 0.5 # 50% discount for days beyond 10
  end


  private_class_method :new

  def self.instance
    @instance ||= new
  end

  def discount(day)
    case day
    when 1
      @first_day_discount
    when 2..4
      @days_2_to_4_discount
    when 5..10
      @days_5_to_10_discount
    else
      @beyond_10_days_discount
    end
  end
end

