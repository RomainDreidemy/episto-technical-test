require 'rspec'
require 'date'
require_relative '../../../../level4/app/strategies/insurance_calculator'
require_relative '../../../../level4/app/models/rental'
require_relative '../../../../level4/app/models/car'
require_relative '../../../../level4/app/models/action'

RSpec.describe InsuranceCalculator do
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

    let(:insurance_calculator) { InsuranceCalculator.new(rental) }

    it 'calculates the insurance amount correctly' do
      total_fee = 7500 * 0.3
      insurance_fee = total_fee / 2

      driver_action = Action.new(
        who: 'driver',
        type: 'debit',
        amount: 7500
      )

      expect(insurance_calculator.calculate_amount({ driver: driver_action})).to eq(insurance_fee) # Half of the commission
    end

    it 'returns correct who and type' do
      expect(insurance_calculator.who).to eq('insurance')
      expect(insurance_calculator.type).to eq('credit')
    end
  end
end