require 'json'
require_relative '../factories/car_factory'
require_relative '../factories/rental_factory'
require_relative '../adapters/rental_output_adapter'

class RentalPriceCalculator
  def initialize(input_file_path, output_file_path)
    @input_file_path = input_file_path
    @output_file_path = output_file_path
  end

  def calculate
    input_data = JSON.parse(File.read(@input_file_path))

    cars = input_data['cars'].map { |car_data| CarFactory.create(car_data) }

    car_getter = ->(id) { cars.find { |car| car.id == id } }
    rentals = input_data['rentals'].map { |rental_data| RentalFactory.create(rental_data, car_getter) }

    output_rentals = rentals.map { |rental| RentalResponseBuilder.new(rental).adapt }

    File.write(
      @output_file_path,
      JSON.pretty_generate({ rentals: output_rentals })
    )
  end
end
