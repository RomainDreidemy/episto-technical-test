class Commission
  attr_reader :insurance_fee, :assistance_fee, :drivy_fee

  def initialize(price:, rental_days:)
    @price = price
    @rental_days = rental_days

    @total_fee = (@price * 0.3).to_i
  end

  def insurance_fee
    @insurance_fee ||= @total_fee / 2
  end

  def assistance_fee
    @assistance_fee ||= 100 * @rental_days
  end

  def drivy_fee
    @drivy_fee ||= @total_fee - insurance_fee - assistance_fee
  end
end