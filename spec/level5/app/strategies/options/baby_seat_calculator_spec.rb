require 'rspec'
require 'date'
require_relative '../../../../../level5/app/strategies/options/baby_seat_calculator'
require_relative '../../../../../level5/app/models/rental'
require_relative '../../../../../level5/app/models/car'
require_relative '../../../../../level5/app/models/option'
require_relative '../../../../../level5/app/strategies/options/option_calculator_strategy'
require_relative '../../../../../level5/app/helpers/days_between_dates'
RSpec.describe BabySeatCalculator do
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

    let(:baby_seat_calculator) { BabySeatCalculator.new(rental) }

    it 'calculates the baby seat amount correctly' do
      expect(baby_seat_calculator.calculate_amount).to eq(600) # 3 days * 200 cents
    end

    it 'returns correct who and type' do
      expect(baby_seat_calculator.type).to eq('baby_seat')
      expect(baby_seat_calculator.credit).to eq('owner')
    end
  end
end