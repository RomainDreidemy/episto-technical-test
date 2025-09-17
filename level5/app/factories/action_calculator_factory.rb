require_relative '../strategies/actions/driver_calculator'
require_relative '../strategies/actions/owner_calculator'
require_relative '../strategies/actions/insurance_calculator'
require_relative '../strategies/actions/assistance_calculator'
require_relative '../strategies/actions/drivy_calculator'

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