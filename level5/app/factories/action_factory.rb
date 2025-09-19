require_relative '../models/actions/driver_action'
require_relative '../models/actions/owner_action'
require_relative '../models/actions/insurance_action'
require_relative '../models/actions/assistance_action'
require_relative '../models/actions/drivy_action'

class ActionFactory
  ACTIONS = {
    'driver' => DriverAction,
    'owner' => OwnerAction,
    'insurance' => InsuranceAction,
    'assistance' => AssistanceAction,
    'drivy' => DrivyAction
  }.freeze

  def self.create(who, rental)
    klass = ACTIONS[who]
    raise ArgumentError, "Unknown who: #{who}" unless klass

    klass.new(rental:)
  end
end