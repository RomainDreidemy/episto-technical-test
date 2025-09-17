require_relative 'action_calculator_strategy'
require_relative '../config/commission_config'

class OwnerCalculator < ActionCalculatorStrategy
  def who
    'owner'
  end

  def type
    'credit'
  end

  def calculate_amount(_ = nil)
   (@rental.price * CommissionConfig.instance.owner_fee_rate).to_i
  end
end
