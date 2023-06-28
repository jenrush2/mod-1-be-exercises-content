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

    def charge_all_eligible
        @registered_contestants.each do |contestant, game|
            if contestant.spending_money > game.cost
                contestant.update_spending_money(-game.cost)
                if @current_contestants == {} or @current_contestants.keys.include?(game) == false
                    @current_contestants[game] = [contestant]
                    @current_contestants
                else
                    @current_contestants[game] << contestant
                    @current_contestants
                end
                @current_contestants
            end
        end
    end

    def draw_winners
        @current_contestants.each do |game, contestants|
            @winners << {contestants.sample.full_name => game.name}
            @winners
        end
        
        return date
    end



                



end