class CommissionConfig
  attr_reader :commission_rate,
              :owner_fee_rate,
              :assistance_fee_per_day,
              :insurance_fee_rate,
              :owner_fee_rate

  def initialize
    @commission_rate = 0.3 # 30% of the rental price
    @owner_fee_rate = 0.7 # 70% of the rental price
    @assistance_fee_per_day = 100 # 1€ per day in cents
    @insurance_fee_rate = 0.5 # 50% of the commission
  end


  private_class_method :new

  def self.instance
    @instance ||= new
  end
end

