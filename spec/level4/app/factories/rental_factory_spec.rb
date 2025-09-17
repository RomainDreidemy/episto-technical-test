# frozen_string_literal: true

require 'rspec'
require_relative '../../../../level4/app/factories/rental_factory'
require_relative '../../../../level4/app/models/rental'
require_relative '../../../../level4/app/models/car'

RSpec.describe RentalFactory do
  describe '#create' do
    let(:car) do
      Car.new(
        id: 1,
        price_per_day: 2000,
        price_per_km: 10
      )
    end

    let(:rental_data) do
      {
        'id' => 1,
        'car_id' => 1,
        'start_date' => '2023-01-01',
        'end_date' => '2023-01-03',
        'distance' => 150
      }
    end

    let(:car_getter) { ->(id) { car if id == car.id } }

    it 'creates a Rental instance with correct attributes' do
      rental = RentalFactory.create(rental_data, car_getter)

      expect(rental).to be_a(Rental)
      expect(rental.id).to eq(1)
      expect(rental.car).to eq(car)
      expect(rental.start_date).to eq(Date.parse('2023-01-01'))
      expect(rental.end_date).to eq(Date.parse('2023-01-03'))
      expect(rental.distance).to eq(150)
    end
  end
end