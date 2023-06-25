require 'rspec'
require './lib/boat'
require './lib/renter'

RSpec.describe Boat do
    it 'exists' do
        kayak = Boat.new(:kayak, 20)

        expect(kayak).to be_an_instance_of(Boat)
    end

    it 'has attributes' do
        kayak = Boat.new(:kayak, 20)

        expect(kayak.type).to eq :kayak
        expect(kayak.price_per_hour).to eq 20
        expect(kayak.hours_rented).to eq 0
    end

    it 'can add hours' do
        kayak = Boat.new(:kayak, 20)

        kayak.add_hour
        kayak.add_hour
        kayak.add_hour

        expect(kayak.hours_rented).to eq 3
    end

    it 'can check if boat is rented' do
        kayak = Boat.new(:kayak, 20)

        expect(kayak.rented?).to eq false

        kayak.rent

        expect(kayak.rented?).to eq true

        kayak.return

        expect(kayak.rented?).to eq false

        
    end

end