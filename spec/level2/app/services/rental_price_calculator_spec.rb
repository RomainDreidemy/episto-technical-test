require 'rspec'
require 'date'
require_relative '../../../../level2/app/factories/rental_factory'
require_relative '../../../../level2/app/models/rental'
require_relative '../../../../level2/app/models/car'
require_relative '../../../../level2/app/factories/car_factory'
require_relative '../../../../level2/app/services/rental_price_calculator'

RSpec.describe RentalPriceCalculator do
  it 'calculates the rental price correctly' do
    calculator = RentalPriceCalculator.new('./level2/data/input.json', 'spec/level2/data/output.json')
    calculator.calculate

    output = JSON.parse(File.read('./spec/level2/data/output.json'))
    expected_output = JSON.parse(File.read('./level2/data/expected_output.json'))

    expect(expected_output).to eq(output)
  end
end
