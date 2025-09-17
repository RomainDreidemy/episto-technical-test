require_relative 'app/services/rental_price_calculator'

RentalPriceCalculator
  .new('./data/input.json', './data/output.json')
  .calculate
