require_relative 'credit_action'
require_relative '../../config/commission_config'

class OwnerAction < CreditAction
  def initialize(rental:)
    super(
      rental:,
      who: 'owner'
    )
  end

  def calculate_amount_without_options
    driver_action = @rental.actions.find(&:driver?)

    raise 'Driver action is required to calculate owner amount' unless driver_action

    (driver_action.amount_without_options * CommissionConfig.instance.owner_fee_rate).to_i
  end
end