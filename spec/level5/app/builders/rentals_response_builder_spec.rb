require 'rspec'
require 'date'
require_relative '../../../../level5/app/builders/rental_response_builder'
require_relative '../../../../level5/app/models/rental'

RSpec.describe RentalResponseBuilder do
  describe '#build' do
    let(:car) do
      double('Car', id: 1, price_per_day: 2000, price_per_km: 10)
    end

    let(:rental) do
      Rental.new(
        id: 1,
        car:,
        start_date: Date.parse('2023-01-01'),
        end_date: Date.parse('2023-01-03'),
        distance: 150,
        options: []
      )
    end

    let(:rental_response_builder) { RentalResponseBuilder.new(rental) }

    it 'builds the rental response with correct structure' do
      response = rental_response_builder.build

      expect(response).to have_key(:id)
      expect(response).to have_key(:actions)
      expect(response).to have_key(:options)

      expect(response[:id]).to eq(1)
      expect(response[:actions]).to be_an(Array)
      expect(response[:options]).to be_an(Array)
    end

    it 'includes correct actions in the response' do
      response = rental_response_builder.build
      actions = response[:actions]

      expected_who_types = %w[driver owner insurance assistance drivy]
      actual_who_types = actions.map { |action| action[:who] }

      expect(actual_who_types).to match_array(expected_who_types)

      actions.each do |action|
        expect(action).to have_key(:who)
        expect(action).to have_key(:type)
        expect(action).to have_key(:amount)
        expect(%w[debit credit]).to include(action[:type])
        expect(action[:amount]).to be_a(Integer)
      end
    end

    it 'includes options in the response' do
      rental.options << double('Option', type: 'gps')
      rental.options << double('Option', type: 'baby_seat')

      response = rental_response_builder.build
      options = response[:options]

      expect(options).to contain_exactly('gps', 'baby_seat')
    end
  end
end