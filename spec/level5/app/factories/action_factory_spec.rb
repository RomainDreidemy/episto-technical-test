require 'rspec'
require_relative '../../../../level5/app/factories/action_factory'
require_relative '../../../../level5/app/models/actions/drivy_action'
require_relative '../../../../level5/app/models/actions/owner_action'
require_relative '../../../../level5/app/models/actions/insurance_action'
require_relative '../../../../level5/app/models/actions/assistance_action'
require_relative '../../../../level5/app/models/actions/driver_action'
require_relative '../../../../level5/app/models/rental'

RSpec.describe ActionFactory do
  let(:car) do
    Car.new(
      id: 1,
      price_per_day: 2000,
      price_per_km: 10
    )
  end

  let(:rental) do
    Rental.new(
      id: 1,
      car:,
      start_date: Date.parse('2023-01-01'),
      end_date: Date.parse('2023-01-03'),
      distance: 150
    )
  end

  describe '#create' do
    it 'creates the correct action instances based on the party' do
      drivy_action = ActionFactory.create('drivy', rental)
      owner_action = ActionFactory.create('owner', rental)
      insurance_action = ActionFactory.create('insurance', rental)
      assistance_action = ActionFactory.create('assistance', rental)
      driver_action = ActionFactory.create('driver', rental)

      expect(drivy_action).to be_a(DrivyAction)
      expect(owner_action).to be_a(OwnerAction)
      expect(insurance_action).to be_a(InsuranceAction)
      expect(assistance_action).to be_a(AssistanceAction)
      expect(driver_action).to be_a(DriverAction)
    end

    it 'raises an error for unknown party' do
      expect { ActionFactory.create('unknown', rental) }.to raise_error(ArgumentError, /Unknown who: unknown/)
    end
  end
end