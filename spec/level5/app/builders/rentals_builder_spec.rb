require 'rspec'
require 'date'
require_relative '../../../../level5/app/builders/rentals_builder'
require_relative '../../../../level5/app/models/rental'

RSpec.describe RentalsBuilder do
  describe '#build_rentals' do
    let(:input_data) do
      {
        'cars' => [
          { 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 },
          { 'id' => 2, 'price_per_day' => 3000, 'price_per_km' => 15 }
        ],
        'rentals' => [
          { 'id' => 1, 'car_id' => 1, 'start_date' => '2023-01-01', 'end_date' => '2023-01-03', 'distance' => 150 },
          { 'id' => 2, 'car_id' => 2, 'start_date' => '2023-02-01', 'end_date' => '2023-02-05', 'distance' => 300 }
        ],
        'options' => [
          { 'id' => 1, 'rental_id' => 1, 'type' => 'gps' },
          { 'id' => 2, 'rental_id' => 1, 'type' => 'baby_seat' },
          { 'id' => 3, 'rental_id' => 2, 'type' => 'additional_insurance' }
        ]
      }
    end

    it 'builds rentals with associated cars and options correctly' do
      rentals_builder = RentalsBuilder.new(input_data)
      rentals = rentals_builder.build_rentals

      expect(rentals.length).to eq(2)

      first_rental = rentals.find { |r| r.id == 1 }
      second_rental = rentals.find { |r| r.id == 2 }

      expect(first_rental.car.id).to eq(1)
      expect(first_rental.options.map(&:type)).to contain_exactly('gps', 'baby_seat')

      expect(second_rental.car.id).to eq(2)
      expect(second_rental.options.map(&:type)).to contain_exactly('additional_insurance')
    end
  end
end