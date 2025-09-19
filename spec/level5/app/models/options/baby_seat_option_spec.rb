require 'rspec'
require 'date'
require_relative '../../../../../level5/app/models/options/baby_seat_option'
require_relative '../../../../../level5/app/models/rental'


RSpec.describe BabySeatOption do
  describe '#compute_amount' do
    let(:rental) do
      Rental.new(
        id: 1,
        car: nil, # Car is not needed for this test
        start_date: Date.parse('2023-01-01'),
        end_date: Date.parse('2023-01-03'),
        distance: 100
      )
    end

    it 'calculates the correct amount for a 3-day rental' do
      option = BabySeatOption.new(id: 1, rental_id: rental.id)
      Rental.new(
        id: 1,
        car: nil, # Car is not needed for this test
        start_date: Date.parse('2023-01-01'),
        end_date: Date.parse('2023-01-03'),
        distance: 100,
        options: [option]
      )

      expect(option.compute_amount).to eq(600) # 3 days * 200 cents/day
    end
  end
end
