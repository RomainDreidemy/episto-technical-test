require 'rspec'
require 'date'
require_relative '../../../../level1/app/factories/rental_factory'
require_relative '../../../../level1/app/models/rental'
require_relative '../../../../level1/app/models/car'
require_relative '../../../../level1/app/factories/car_factory'
require_relative '../../../../level1/app/services/rental_price_calculator'

RSpec.describe RentalPriceCalculator do
  it 'calculates the rental price correctly' do
    calculator = RentalPriceCalculator.new('./level1/data/input.json', 'spec/level1/data/output.json')
    calculator.calculate

    output = JSON.parse(File.read('./spec/level1/data/output.json'))
    expected_output = JSON.parse(File.read('./level1/data/expected_output.json'))

    expect(output).to eq(expected_output)
  end
end
