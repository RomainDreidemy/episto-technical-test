require 'rspec'
require 'date'
require_relative '../../../../level3/app/factories/rental_factory'
require_relative '../../../../level3/app/models/rental'
require_relative '../../../../level3/app/models/car'
require_relative '../../../../level3/app/factories/car_factory'
require_relative '../../../../level3/app/services/rental_price_calculator'

RSpec.describe RentalPriceCalculator do
  it 'calculates the rental price correctly' do
    calculator = RentalPriceCalculator.new('./level3/data/input.json', 'spec/level3/data/output.json')
    calculator.calculate

    output = JSON.parse(File.read('./spec/level3/data/output.json'))
    expected_output = JSON.parse(File.read('./level3/data/expected_output.json'))

    expect(expected_output).to eq(output)
  end
end
