# frozen_string_literal: true

require 'rspec'
require_relative '../../../../level2/app/factories/car_factory'
require_relative '../../../../level2/app/models/car'

RSpec.describe CarFactory do
  describe '#create' do
    let(:car_data) do
      {
        'id' => 1,
        'price_per_day' => 2000,
        'price_per_km' => 10
      }
    end

    it 'creates a Car instance with correct attributes' do
      car = CarFactory.create(car_data)

      expect(car).to be_a(Car)
      expect(car.id).to eq(1)
      expect(car.price_per_day).to eq(2000)
      expect(car.price_per_km).to eq(10)
    end
  end
end