require 'json'
require_relative '../factories/car_factory'
require_relative '../factories/rental_factory'
require_relative '../factories/option_factory'
require_relative '../builders/rental_response_builder'
require_relative '../builders/rentals_builder'

class RentalPriceCalculator
  def initialize(input_file_path, output_file_path)
    @input_file_path = input_file_path
    @output_file_path = output_file_path
  end

  def calculate
    input_data = JSON.parse(File.read(@input_file_path))

    rentals = RentalsBuilder.new(input_data).build_rentals

    output_rentals = rentals.map { |rental| RentalResponseBuilder.new(rental).build }

    File.write(
      @output_file_path,
      JSON.pretty_generate({ rentals: output_rentals })
    )
  end
end
