require 'date'
require_relative '../models/rental'

class RentalFactory
  # @return [Rental]
  def self.create(data, car_getter)
    car = car_getter.call(data['car_id'])

    Rental.new(
      id: data['id'],
      car:,
      start_date: Date.parse(data['start_date']),
      end_date: Date.parse(data['end_date']),
      distance: data['distance']
    )
  end
end
