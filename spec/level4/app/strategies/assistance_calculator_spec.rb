require 'rspec'
require 'date'
require_relative '../../../../level4/app/strategies/assistance_calculator'
require_relative '../../../../level4/app/models/rental'
require_relative '../../../../level4/app/models/car'

RSpec.describe AssistanceCalculator do
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

    let(:assistance_calculator) { AssistanceCalculator.new(rental) }

    it 'calculates the assistance amount correctly' do
      expect(assistance_calculator.calculate_amount).to eq(300) # 3 days * 100 cents
    end

    it 'returns correct who and type' do
      expect(assistance_calculator.who).to eq('assistance')
      expect(assistance_calculator.type).to eq('credit')
    end
  end
end