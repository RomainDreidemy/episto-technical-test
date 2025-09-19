class RentalSerializer
  def initialize(computed_rental)
    @computed_rental = computed_rental
  end

  def serialize
    {
      id: @computed_rental.rental.id,
      actions: @computed_rental.actions.map do |action|
        {
          who: action.who,
          type: action.type,
          amount: action.amount
        }
      end
    }
  end
end