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

end