require 'rspec'
require './lib/game'
require './lib/contestant'

RSpec.describe Contestant do
    it 'exists' do
        alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})

        expect(alexander).to be_an_instance_of Contestant
    end

    it 'has attributes' do
        alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})

        expect(alexander.first_name).to eq 'Alexander'
        expect(alexander.last_name).to eq 'Aigiades'
        expect(alexander.age).to eq 28
        expect(alexander.state_of_residence).to eq 'CO'
        expect(alexander.spending_money).to eq 10
    end
end