require 'rspec'
require 'date'
require_relative '../../../../../level5/app/models/actions/driver_action'
require_relative '../../../../../level5/app/models/car'
require_relative '../../../../../level5/app/models/rental'

RSpec.describe DriverAction do

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
        end_date: Date.parse('2023-01-03'),
        distance: 150
      )
    end

    let(:driver_action) { DriverAction.new(rental:) }

    it 'calculates the correct amount without options' do
      expected_daily_cost = 1 * 2000 + 2 * 1800 # 3 days with decreasing rates
      expected_distance_cost = 150 * 10 # 150 km at 10 per km
      expected_total = expected_daily_cost + expected_distance_cost

      expect(driver_action.calculate_amount_without_options).to eq(expected_total)
    end
  end
end
