require 'rspec'
require 'date'
require_relative '../../../../../level5/app/models/actions/credit_action'
require_relative '../../../../../level5/app/models/options/additional_insurance_option'
require_relative '../../../../../level5/app/models/options/baby_seat_option'
require_relative '../../../../../level5/app/models/options/gps_option'
require_relative '../../../../../level5/app/models/car'
require_relative '../../../../../level5/app/models/rental'

RSpec.describe CreditAction do
  describe '#calculate_amount_without_options' do
    let(:car) do
      Car.new(
        id: 1,
        price_per_day: 2000,
        price_per_km: 10
      )
    end

    let(:insurance_option) do
      AdditionalInsuranceOption.new(
        id: 1,
        rental_id: 1,
      )
    end

    let(:baby_seat_option) do
      BabySeatOption.new(
        id: 2,
        rental_id: 1,
      )
    end

    let(:gps_option) do
      GpsOption.new(
        id: 3,
        rental_id: 1,
      )
    end

    let(:rental) do
      Rental.new(
        id: 1,
        car:,
        start_date: Date.parse('2023-01-01'),
        end_date: Date.parse('2023-01-03'),
        distance: 150,
        options: [insurance_option, baby_seat_option, gps_option]
      )
    end

    it 'calculates the correct options amount' do
      action = CreditAction.new(rental:, who: 'drivy')
      expect(action.calculate_options_amount).to eq(3000) # 3 days * 1000 cents/day

      action = CreditAction.new(rental:, who: 'owner')
      expect(action.calculate_options_amount).to eq(2100) # 3 days * 500 cents/day + 3 days * 200 cents/day
    end

    it 'raises NotImplementedError when calling calculate_amount_without_options' do
      action = CreditAction.new(rental:, who: 'driver')
      expect { action.calculate_amount_without_options }.to raise_error(NotImplementedError)
    end
  end
end
