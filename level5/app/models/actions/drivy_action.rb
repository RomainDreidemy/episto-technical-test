require_relative 'credit_action'
require_relative '../../config/commission_config'

class DrivyAction < CreditAction
  def initialize(rental:)
    super(
      rental:,
      who: 'drivy'
    )
  end

  def calculate_amount_without_options
    driver_action = @rental.actions.find(&:driver?)
    insurance_action = @rental.actions.find(&:insurance?)
    assistance_action = @rental.actions.find(&:assistance?)

    raise 'Driver action is required to calculate drivy amount' unless driver_action
    raise 'Insurance action is required to calculate drivy amount' unless insurance_action
    raise 'Assistance action is required to calculate drivy amount' unless assistance_action

    total_commission = driver_action.amount_without_options * CommissionConfig.instance.commission_rate
    insurance_amount = insurance_action.amount
    assistance_amount = assistance_action.amount

    (total_commission - insurance_amount - assistance_amount).to_i
  end
end