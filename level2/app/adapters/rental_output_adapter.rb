class RentalResponseBuilder
  def initialize(rental)
    @rental = rental
  end

  def adapt
    {
      id: @rental.id,
      price: @rental.price
    }
  end
end
