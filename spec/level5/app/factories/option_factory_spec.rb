require 'rspec'
require_relative '../../../../level5/app/factories/option_factory'
require_relative '../../../../level5/app/models/options/gps_option'
require_relative '../../../../level5/app/models/options/baby_seat_option'
require_relative '../../../../level5/app/models/options/additional_insurance_option'
require_relative '../../../../level5/app/models/rental'
require_relative '../../../../level5/app/models/car'

RSpec.describe OptionFactory do
  describe '#create' do
    it 'creates the correct option instances based on the type' do
      gps_option = OptionFactory.create({ 'type' => 'gps' })
      baby_seat_option = OptionFactory.create({ 'type' => 'baby_seat' })
      insurance_option = OptionFactory.create({ 'type' => 'additional_insurance' })

      expect(gps_option).to be_a(GpsOption)
      expect(baby_seat_option).to be_a(BabySeatOption)
      expect(insurance_option).to be_a(AdditionalInsuranceOption)
    end
  end
end