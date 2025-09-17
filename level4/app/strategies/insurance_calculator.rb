require_relative 'action_calculator_strategy'
require_relative '../config/commission_config'

class InsuranceCalculator < ActionCalculatorStrategy
  def who
    'insurance'
  end

  def type
    'credit'
  end

  def calculate_amount(_ = nil)
    commission_config = CommissionConfig.instance

    (
      @rental.price *
        commission_config.commission_rate *
        commission_config.insurance_fee_rate
    ).to_i
  end
end
