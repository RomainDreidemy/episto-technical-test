require 'rspec'
require 'date'
require_relative '../../../../level5/app/factories/rental_factory'
require_relative '../../../../level5/app/models/rental'
require_relative '../../../../level5/app/models/car'
require_relative '../../../../level5/app/factories/car_factory'
require_relative '../../../../level5/app/services/rentals_computation'

RSpec.describe RentalsComputation do
  it 'calculates the rental price correctly' do
    calculator = RentalsComputation.new('./level5/data/input.json', 'spec/level5/data/output.json')
    calculator.calculate

    output = JSON.parse(File.read('./spec/level5/data/output.json'))
    expected_output = JSON.parse(File.read('./level5/data/expected_output.json'))

    expect(expected_output).to eq(output)
  end
end
