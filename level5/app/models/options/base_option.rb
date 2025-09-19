class BaseOption
  attr_reader :id, :rental_id, :type, :rental, :credited_party, :debited_party

  def initialize(id:, rental_id:, type:, credited_party:, debited_party:)
    @id = id
    @rental_id = rental_id
    @type = type
    @rental = nil
    @credited_party = credited_party
    @debited_party = debited_party

    @amount = nil
  end

  def amount
    @amount ||= compute_amount
  end

  def compute_amount
    raise NotImplementedError, 'Subclasses must implement the compute_amount method'
  end

  def rental=(rental)
    @rental = rental
  end
end
