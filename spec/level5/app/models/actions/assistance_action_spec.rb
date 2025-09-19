require 'rspec'
require 'date'
require_relative '../../../../../level5/app/models/actions/assistance_action'
require_relative '../../../../../level5/app/models/car'
require_relative '../../../../../level5/app/models/rental'

RSpec.describe AssistanceAction do
  describe '#calculate_amount_without_options' do
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

    it 'calculates the correct amount without options' do
      action = AssistanceAction.new(rental:)
      expect(action.calculate_amount_without_options).to eq(300) # 3 days * 100 cents/day
    end
  end
end
