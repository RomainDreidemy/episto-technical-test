require_relative '../models/option'

class OptionFactory
  def self.create(data)
    Option.new(
      id: data['id'],
      rental_id: data['rental_id'],
      type: data['type']
    )
  end
end
