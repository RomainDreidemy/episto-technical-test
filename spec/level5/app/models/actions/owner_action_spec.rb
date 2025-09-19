require 'rspec'
require 'date'
require_relative '../../../../../level5/app/models/actions/driver_action'
require_relative '../../../../../level5/app/models/actions/owner_action'
require_relative '../../../../../level5/app/models/car'
require_relative '../../../../../level5/app/models/rental'

RSpec.describe OwnerAction do
  describe '#calculate_amount_without_options' do
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
        end_date: Date.parse('2023-01-01'),
        distance: 150,
      )
    end
    let(:driver_action) do
      DriverAction.new(rental:)
    end

    let(:owner_action) do
      OwnerAction.new(rental:)
    end

    before do
      rental.add_action(driver_action)
    end

    it 'calculates the correct insurance amount without options' do
      expect(owner_action.calculate_amount_without_options).to eq(2450)
    end
  end
end
