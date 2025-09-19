require 'rspec'
require 'date'
require_relative '../../../../../level5/app/models/actions/driver_action'
require_relative '../../../../../level5/app/models/actions/insurance_action'
require_relative '../../../../../level5/app/models/car'
require_relative '../../../../../level5/app/models/rental'

RSpec.describe InsuranceAction do
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

    it 'calculates the correct amount without options' do
      rental.add_action(DriverAction.new(rental:))
      action = InsuranceAction.new(rental:)
      expect(action.calculate_amount_without_options).to eq(525) # (2000 + 1500) * 0.3 * 0.5
    end
  end
end
