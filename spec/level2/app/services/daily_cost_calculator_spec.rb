require 'rspec'
require 'date'
require_relative '../../../../level2/app/factories/rental_factory'
require_relative '../../../../level2/app/models/rental'
require_relative '../../../../level2/app/models/car'
require_relative '../../../../level2/app/factories/car_factory'
require_relative '../../../../level2/app/services/daily_cost_calculator'

RSpec.describe DailyCostCalculator do
  describe '#calculate' do
    it 'calculates the daily cost without discount' do
      calculator = DailyCostCalculator.new(Date.parse('2023-01-01'), Date.parse('2023-01-01'), 2000)
      expect(calculator.calculate).to eq(2000)
    end

    it 'calculates the daily cost with 10% discount for days 2 to 4' do
      calculator = DailyCostCalculator.new(Date.parse('2023-01-01'), Date.parse('2023-01-03'), 2000)
      expect(calculator.calculate).to eq(2000 + (2000 * 0.9) * 2)
    end

    it 'calculates the daily cost with 30% discount for days 5 to 10' do
      calculator = DailyCostCalculator.new(Date.parse('2023-01-01'), Date.parse('2023-01-07'), 2000)
      expected_cost = 2000 + (2000 * 0.9) * 3 + (2000 * 0.7) * 3
      expect(calculator.calculate).to eq(expected_cost)
    end

    it 'calculates the daily cost with 50% discount for days beyond 10' do
      calculator = DailyCostCalculator.new(Date.parse('2023-01-01'), Date.parse('2023-01-12'), 2000)
      expected_cost = 2000 + (2000 * 0.9) * 3 + (2000 * 0.7) * 6 + (2000 * 0.5) * 2
      expect(calculator.calculate).to eq(expected_cost)
    end
  end
end