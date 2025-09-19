class BaseAction
  attr_reader :who, :type, :rental

  POSSIBLE_WHO = %w[driver owner insurance assistance platform].freeze

  def initialize(who:, type:, rental:)
    @who = who
    @type = type
    @rental = rental

    @amount = nil
    @amount_without_options = nil
  end

  def amount
    @amount ||= calculate_amount_with_options
  end

  def amount_without_options
    @amount_without_options ||= calculate_amount_without_options
  end

  def calculate_amount_without_options
    raise NotImplementedError, "Subclasses must implement the total_amount method"
  end

  def calculate_amount_with_options
    calculate_amount_without_options + calculate_options_amount
  end

  def calculate_options_amount
    raise NotImplementedError, "Subclasses must implement the total_amount method"
  end

  def calculate
    amount
    amount_without_options
  end

  POSSIBLE_WHO.each do |who|
    define_method("#{who}?") do
      @who == who
    end
  end
end