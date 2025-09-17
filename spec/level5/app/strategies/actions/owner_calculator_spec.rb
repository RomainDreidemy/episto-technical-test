require 'rspec'
require 'date'
require_relative '../../../../../level5/app/strategies/actions/owner_calculator'
require_relative '../../../../../level5/app/models/rental'
require_relative '../../../../../level5/app/models/car'

RSpec.describe OwnerCalculator do
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

    let(:owner_calculator) { OwnerCalculator.new(rental) }

    it 'calculates the owner amount correctly' do
      total_fee = 7500 * 0.3
      owner_amount = 7500 - total_fee

      expect(owner_calculator.calculate_amount_without_options(
        {
          driver: { amount_without_options: 7500 }
        })).to eq(owner_amount) # Owner gets the rental price minus the commission
    end

    it 'returns correct who and type' do
      expect(owner_calculator.who).to eq('owner')
      expect(owner_calculator.type).to eq('credit')
    end
  end
end