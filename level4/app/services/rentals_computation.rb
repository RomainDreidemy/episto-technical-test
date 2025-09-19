require 'json'
require_relative '../factories/car_factory'
require_relative '../factories/rental_factory'
require_relative '../serializers/computed_rental_serializer'

class RentalsComputation
  def initialize(input_file_path, output_file_path)
    @input_file_path = input_file_path
    @output_file_path = output_file_path
  end

  def calculate
    input_data = JSON.parse(File.read(@input_file_path))

    cars = input_data['cars'].map { |car_data| CarFactory.create(car_data) }

    car_getter = ->(id) { cars.find { |car| car.id == id } }
    rentals = input_data['rentals'].map { |rental_data| RentalFactory.create(rental_data, car_getter) }

    computed_rentals = rentals.map(&:compute)

    serialized_rentals = computed_rentals
                           .map { |computed_rental| RentalSerializer.new(computed_rental).serialize }

    File.write(
      @output_file_path,
      JSON.pretty_generate({ rentals: serialized_rentals })
    )
  end
end
