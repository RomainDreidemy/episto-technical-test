require_relative 'credit_action'
require_relative '../../config/commission_config'

class InsuranceAction < CreditAction
  def initialize(rental:)
    super(
      rental:,
      who: 'insurance'
    )
  end

  def calculate_amount_without_options
    commission_config = CommissionConfig.instance
    driver_action = @rental.actions.find(&:driver?)

    raise 'Driver action is required to calculate insurance amount' unless driver_action

    (
      driver_action.amount_without_options *
        commission_config.commission_rate *
        commission_config.insurance_fee_rate
    ).to_i
  end
end