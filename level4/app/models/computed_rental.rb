class ComputedRental
  attr_reader :rental, :actions

  def initialize(rental, actions)
    @rental = rental
    @actions = actions
  end
end