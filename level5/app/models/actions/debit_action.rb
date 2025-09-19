require_relative 'base_action'

class DebitAction < BaseAction
  def initialize(rental:, who:)
    super(
      rental:,
      who:,
      type: 'debit'
    )
  end

  def calculate_options_amount
    @rental.options.sum(&:amount)
  end
end