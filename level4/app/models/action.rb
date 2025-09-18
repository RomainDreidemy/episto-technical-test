class Action
  attr_reader :who, :type, :amount_without_options, :amount

  def initialize(who:, type:, amount:)
    @who = who
    @type = type
    @amount_without_options = amount_without_options
    @amount = amount
  end

  def to_h
    {
      who: @who,
      type: @type,
      amount: @amount
    }
  end
end