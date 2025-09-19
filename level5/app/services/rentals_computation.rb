require 'json'

require_relative '../builders/rentals_builder'
require_relative '../serializers/rental_serializer'

class RentalsComputation
  def initialize(input_file_path, output_file_path)
    @input_file_path = input_file_path
    @output_file_path = output_file_path
  end

  def calculate
    input_data = JSON.parse(File.read(@input_file_path))

    rentals = RentalsBuilder.new(input_data).build_rentals_from_input_file

    rentals.map(&:compute)

    serialized_rentals = RentalSerializer.each_serialize(rentals)

    File.write(
      @output_file_path,
      JSON.pretty_generate({ rentals: serialized_rentals })
    )
  end
end
