class Rental
  attr_reader :id, :car, :start_date, :end_date, :distance

  def initialize(id:, car:, start_date:, end_date:, distance:)
    @id = id
    @car = car
    @start_date = start_date
    @end_date = end_date
    @distance = distance
  end

  def price
    daily_cost + distance_cost
  end

  private

  def nb_of_days
    (end_date - start_date).to_i + 1
  end

  def daily_cost
    car.price_per_day * nb_of_days
  end

  def distance_cost
    car.price_per_km * distance
  end
end
