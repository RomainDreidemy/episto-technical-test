require_relative '../factories/car_factory'
require_relative '../factories/option_factory'
require_relative '../factories/rental_factory'

class RentalsBuilder
  def initialize(input_data)
    @input_data = input_data
  end

  def build_rentals_from_input_file
    cars = @input_data['cars'].map { |car_data| CarFactory.create(car_data) }
    options = @input_data['options'].map { |option_data| OptionFactory.create(option_data) }

    car_getter = ->(id) { cars.find { |car| car.id == id } }
    options_getter = ->(id) { options.filter { |option| option.rental_id == id } }

    @input_data['rentals'].map { |rental_data| RentalFactory.create(rental_data, car_getter, options_getter) }
  end
end