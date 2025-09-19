require_relative 'app/services/rentals_computation'

RentalsComputation
  .new('./data/input.json', './data/output.json')
  .calculate
