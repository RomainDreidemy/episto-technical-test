require 'rspec'
require 'date'
require_relative '../../../../level3/app/models/rental'
require_relative '../../../../level3/app/models/car'
require_relative '../../../../level3/app/factories/car_factory'

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

    it 'prices the rental correctly' do
      expect(rental.price).to eq(2000 + 2000 * 2 * 0.9 + 10 * 150) # 3 days (2 at -10%), 150 km
    end

    it 'calculates the commission correctly' do
      total_fee = rental.price * 0.3
      expect(rental.commission.insurance_fee).to eq(total_fee / 2)
      expect(rental.commission.assistance_fee).to eq(300)   # 1 per day for 3 days
      expect(rental.commission.drivy_fee).to eq(total_fee - rental.commission.insurance_fee - rental.commission.assistance_fee)     # Remaining part of the commission
    end
  end
end