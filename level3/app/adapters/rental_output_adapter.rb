class RentalResponseBuilder
  def initialize(rental)
    @rental = rental
  end

  def adapt
    {
      id: @rental.id,
      price: @rental.price,
      commission: {
        insurance_fee: @rental.commission.insurance_fee,
        assistance_fee: @rental.commission.assistance_fee,
        drivy_fee: @rental.commission.drivy_fee
      }
    }
  end
end
