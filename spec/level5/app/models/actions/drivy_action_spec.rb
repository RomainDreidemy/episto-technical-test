require 'rspec'
require 'date'
require_relative '../../../../../level5/app/models/actions/drivy_action'
require_relative '../../../../../level5/app/models/actions/driver_action'
require_relative '../../../../../level5/app/models/actions/insurance_action'
require_relative '../../../../../level5/app/models/actions/assistance_action'
require_relative '../../../../../level5/app/models/car'
require_relative '../../../../../level5/app/models/rental'

RSpec.describe DrivyAction do
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
        end_date: Date.parse('2023-01-01'),
        distance: 150,
      )
    end

    let(:driver_action) { DriverAction.new(rental:) }
    let(:insurance_action) { InsuranceAction.new(rental:) }
    let(:assistance_action) { AssistanceAction.new(rental:) }

    let(:drivy_action) { DrivyAction.new(rental:) }

    before do
      rental.add_action(driver_action)
      rental.add_action(insurance_action)
      rental.add_action(assistance_action)
    end

    it 'calculates the correct amount without options' do
      expected_amount = (
        (driver_action.amount_without_options * 0.3) -
          insurance_action.amount -
          assistance_action.amount
      ).to_i

      expect(drivy_action.calculate_amount_without_options).to eq(expected_amount)
    end
  end
end
