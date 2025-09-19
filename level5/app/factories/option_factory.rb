require_relative '../models/options/gps_option'
require_relative '../models/options/baby_seat_option'
require_relative '../models/options/additional_insurance_option'

class OptionFactory
  def self.create(data)
    case data['type']
    when 'gps'
      klass = GpsOption
    when 'baby_seat'
      klass = BabySeatOption
    when 'additional_insurance'
      klass = AdditionalInsuranceOption
    else
      raise "Unknown option type: #{data['type']}"
    end

    klass.new(
      id: data['id'],
      rental_id: data['rental_id'],
    )
  end
end
