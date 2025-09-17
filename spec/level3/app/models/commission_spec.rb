require 'rspec'
require 'date'
require_relative '../../../../level3/app/models/commission'


RSpec.describe Commission do
  describe '#initialize' do
    let(:commission) do
      Commission.new(price: 10000, rental_days: 1)
    end

    it 'initializes with correct attributes' do
      expect(commission.insurance_fee).to eq(1500) # 10000 * 0.3 / 2
      expect(commission.assistance_fee).to eq(100) # 1e * rental_days
      expect(commission.drivy_fee).to eq(1400) # 10000 * 0.3 - insurance_fee - assistance_fee
    end

    it 'calculates fees correctly for multiple days' do
      commission_multi_day = Commission.new(price: 30000, rental_days: 3)
      expect(commission_multi_day.insurance_fee).to eq(4500)
      expect(commission_multi_day.assistance_fee).to eq(300)
      expect(commission_multi_day.drivy_fee).to eq(4200)
    end
  end
end
