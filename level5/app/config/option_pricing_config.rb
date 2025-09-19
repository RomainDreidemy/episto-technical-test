class OptionPricingConfig
  attr_reader :gps_daily_price, :baby_seat_daily_price, :additional_insurance_daily_price

  def initialize
    @gps_daily_price = 500 # in cents
    @baby_seat_daily_price = 200 # in cents
    @additional_insurance_daily_price = 1000 # in cents
  end

  private_class_method :new

  def self.instance
    @instance ||= new
  end
end

