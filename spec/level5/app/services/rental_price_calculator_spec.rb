require 'rspec'
require 'date'
require_relative '../../../../level5/app/factories/rental_factory'
require_relative '../../../../level5/app/models/rental'
require_relative '../../../../level5/app/models/car'
require_relative '../../../../level5/app/factories/car_factory'
require_relative '../../../../level5/app/services/rental_price_calculator'

RSpec.describe RentalPriceCalculator do
  it 'calculates the rental price correctly' do
    calculator = RentalPriceCalculator.new('./level5/data/input.json', 'spec/level5/data/output.json')
    calculator.calculate

    output = JSON.parse(File.read('./spec/level5/data/output.json'))
    expected_output = JSON.parse(File.read('./level5/data/expected_output.json'))

    expect(output).to eq(expected_output)
  end
end
