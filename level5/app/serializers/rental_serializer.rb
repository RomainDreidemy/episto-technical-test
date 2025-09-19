class RentalSerializer
  def initialize(rental)
    @rental = rental
  end

  def serialize
    {
      id: @rental.id,
      options: @rental.options.map(&:type),
      actions: @rental.actions.map do |action|
        {
          who: action.who,
          type: action.type,
          amount: action.amount
        }
      end
    }
  end

  def self.each_serialize(rentals)
    rentals.map { |rental| new(rental).serialize }
  end
end