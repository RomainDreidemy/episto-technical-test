require 'rspec'
require 'date'
require_relative '../../../../level4/app/models/rental'
require_relative '../../../../level4/app/models/car'
require_relative '../../../../level4/app/factories/car_factory'

RSpec.describe Rental do
  describe '#initialize' do
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

    it 'initializes with correct attributes' do
      expect(rental.id).to eq(1)
      expect(rental.car).to eq(car)
      expect(rental.start_date).to eq(Date.parse('2023-01-01'))
      expect(rental.end_date).to eq(Date.parse('2023-01-03'))
      expect(rental.distance).to eq(150)
    end
  end
end