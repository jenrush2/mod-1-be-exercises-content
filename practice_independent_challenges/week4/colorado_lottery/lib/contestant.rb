require './lib/game'

class Contestant
    attr_reader :first_name, 
                :last_name,
                :age,
                :state_of_residence,
                :spending_money

    def initialize(args)
        @first_name = args[:first_name]
        @last_name = args[:last_name]
        @age = args[:age]
        @state_of_residence = args[:state_of_residence]
        @spending_money = args[:spending_money]
    end

    def full_name
        "#{first_name} #{last_name}"
    end
end