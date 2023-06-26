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
    end
end