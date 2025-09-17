require 'rspec'
require 'date'
require_relative '../../../../level4/app/strategies/drivy_calculator'
require_relative '../../../../level4/app/models/rental'
require_relative '../../../../level4/app/models/car'

RSpec.describe DrivyCalculator do
  describe '#calculate' do
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

    let(:drivy_calculator) { DrivyCalculator.new(rental) }

    it 'calculates the drivy amount correctly' do
      total_fee = rental.price * 0.3
      nb_days = (rental.end_date - rental.start_date).to_i + 1
      assistance_fee = nb_days * 100
      insurance_fee = total_fee / 2
      drivy_fee = total_fee - insurance_fee - assistance_fee

      expect(drivy_calculator.calculate_amount(
        {
          insurance: { amount: insurance_fee },
          assistance: { amount: assistance_fee }
        }
      )).to eq(drivy_fee) # Remaining part of the commission
    end

    it 'returns correct who and type' do
      expect(drivy_calculator.who).to eq('drivy')
      expect(drivy_calculator.type).to eq('credit')
    end
  end
end