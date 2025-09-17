require_relative 'action_calculator_strategy'
require_relative '../../config/commission_config'

class OwnerCalculator < ActionCalculatorStrategy
  def who
    'owner'
  end

  def type
    'credit'
  end

  def calculate_amount_without_options(dependency_actions = {}, _ = nil)
    driver_action = dependency_actions[:driver]

    raise 'Driver action is required to calculate owner amount' unless driver_action

   (driver_action[:amount_without_options] * CommissionConfig.instance.owner_fee_rate).to_i
  end
end
