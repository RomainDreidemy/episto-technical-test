require_relative 'base_action'

class CreditAction < BaseAction
  def initialize(rental:, who:)
    super(
      rental:,
      who:,
      type: 'credit'
    )
  end

  def calculate_options_amount
    @rental.options
           .filter { |option| option.credited_party == who }
           .sum { |option| option.amount }
  end
end