require_relative 'action_calculator_strategy'
require_relative '../config/commission_config'

class InsuranceCalculator < ActionCalculatorStrategy
  def who
    'insurance'
  end

  def type
    'credit'
  end

  def calculate_amount(dependency_actions = {}, _ = nil)
    commission_config = CommissionConfig.instance
    driver_action = dependency_actions[:driver]

    raise 'Driver action is required to calculate insurance amount' unless driver_action

    (
      driver_action.amount *
        commission_config.commission_rate *
        commission_config.insurance_fee_rate
    ).to_i
  end
end
