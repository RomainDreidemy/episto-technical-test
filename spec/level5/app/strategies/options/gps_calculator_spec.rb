require 'rspec'
require 'date'
require_relative '../../../../../level5/app/strategies/options/gps_calculator'
require_relative '../../../../../level5/app/models/rental'
require_relative '../../../../../level5/app/models/car'
require_relative '../../../../../level5/app/models/option'
require_relative '../../../../../level5/app/strategies/options/option_calculator_strategy'
require_relative '../../../../../level5/app/helpers/days_between_dates'
RSpec.describe GpsCalculator do
  describe '#calculate_amount' do
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
        distance: 150,
        options: [Option.new(id: 1, rental_id: 1, type: 'gps')]
      )
    end

    let(:gps_calculator) { GpsCalculator.new(rental) }

    it 'calculates the GPS option amount correctly' do
      days = 3 # From Jan 1 to Jan 3 inclusive
      expected_amount = days * 500 # GPS costs 5e (500 cents) per day

      expect(gps_calculator.calculate_amount).to eq(expected_amount)
    end

    it 'returns correct type and credit' do
      expect(gps_calculator.type).to eq('gps')
      expect(gps_calculator.credit).to eq('owner')
    end
  end
end