require 'rspec'
require 'date'
require_relative '../../../../level4/app/strategies/driver_calculator'
require_relative '../../../../level4/app/models/rental'
require_relative '../../../../level4/app/models/car'

RSpec.describe DriverCalculator do
  describe '#calculate' do
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

    let(:driver_calculator) { DriverCalculator.new(rental) }

    it 'calculates the driver amount correctly' do
      expect(driver_calculator.calculate_amount).to eq(2000 + 2000 * 2 * 0.9 + 10 * 150) # 3 days (2 at -10%), 150 km
    end

    it 'returns correct who and type' do
      expect(driver_calculator.who).to eq('driver')
      expect(driver_calculator.type).to eq('debit')
    end
  end
end