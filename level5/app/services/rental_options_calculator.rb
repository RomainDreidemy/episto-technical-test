require_relative '../factories/option_calculator_factory'

class RentalOptionsCalculator
  def initialize(rental)
    @rental = rental
  end

  def calculate
    @rental.options.reduce({}) do |options, option|
      options[option.type.to_sym] = OptionCalculatorFactory.create(option.type, @rental)
                                                           .calculate
      options
    end
  end
end