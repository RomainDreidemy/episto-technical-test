require_relative 'action_calculator_strategy'
require_relative '../../config/commission_config'

class DrivyCalculator < ActionCalculatorStrategy
  def who
    'drivy'
  end

  def type
    'credit'
  end

  def calculate_amount_without_options(dependencies = {}, _ = nil)
    driver_action = dependencies[:driver]

    raise 'Driver action is required to calculate drivy amount' unless driver_action

    total_commission = driver_action[:amount_without_options] * CommissionConfig.instance.commission_rate
    insurance_amount = dependencies[:insurance]&.dig(:amount) || 0
    assistance_amount = dependencies[:assistance]&.dig(:amount) || 0

    (total_commission - insurance_amount - assistance_amount).to_i
  end
end
