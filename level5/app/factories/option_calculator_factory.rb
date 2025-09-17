require_relative '../strategies/options/gps_calculator'
require_relative '../strategies/options/baby_seat_calculator'
require_relative '../strategies/options/additional_insurance_calculator'

class OptionCalculatorFactory
  CALCULATORS = {
    'gps' => GpsCalculator,
    'baby_seat' => BabySeatCalculator,
    'additional_insurance' => AdditionalInsuranceCalculator
  }.freeze

  def self.create(option, rental)
    calculator_class = CALCULATORS[option]
    raise ArgumentError, "Unknown option: #{option}" unless calculator_class

    calculator_class.new(rental)
  end
end