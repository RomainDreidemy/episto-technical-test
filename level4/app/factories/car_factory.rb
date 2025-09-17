# frozen_string_literal: true

require_relative '../models/car'

class CarFactory
  def self.create(data)
    Car.new(
      id: data['id'],
      price_per_day: data['price_per_day'],
      price_per_km: data['price_per_km']
    )
  end
end
