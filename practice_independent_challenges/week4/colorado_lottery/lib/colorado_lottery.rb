class ColoradoLottery
    attr_reader :registered_contestants, :winners, :current_contestants
    def initialize
        @registered_contestants = {}
        @winners = []
        @current_contestants = {}
    end

    def interested_and_18?(contestant, game)
        if contestant.game_interests.include?(game.name) == true and contestant.age >= 18
            true
        else
            false
        end
    end

    def can_register?(contestant, game)
        if interested_and_18?(contestant, game) == true and (contestant.out_of_state? == false || game.national_drawing? == true) == true
            true
        else
            false
        end
    end

    def register_contestant(contestant, game)
        if can_register?(contestant, game) == true
            @registered_contestants[contestant] = game
        else
            @registered_contestants
        end
        @registered_contestants
    end

    def eligible_contestants(given_game)
        array = []
        @registered_contestants.each do |contestant, game|
            p "#{contestant.first_name} is registered for #{game.name}"
        end
        @registered_contestants.each do |contestant, game|
            if game == given_game and contestant.spending_money > game.cost
                array << contestant
                array
            else
                array
            end
            array
        end
        array
    end



end