require_relative '../strategies/driver_calculator'
require_relative '../strategies/owner_calculator'
require_relative '../strategies/insurance_calculator'
require_relative '../strategies/assistance_calculator'
require_relative '../strategies/drivy_calculator'

class ActionCalculatorFactory
  CALCULATORS = {
    'driver' => DriverCalculator,
    'owner' => OwnerCalculator,
    'insurance' => InsuranceCalculator,
    'assistance' => AssistanceCalculator,
    'drivy' => DrivyCalculator
  }.freeze

  def self.create(who, rental)
    calculator_class = CALCULATORS[who]
    raise ArgumentError, "Unknown actor: #{who}" unless calculator_class

    calculator_class.new(rental)
  end
end