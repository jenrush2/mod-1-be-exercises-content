require './lib/boat'
require './lib/renter'

class Dock
    attr_reader :name, :max_rental_time, :rental_log

    def initialize(name, max_rental_time)
        @name = name
        @max_rental_time = max_rental_time
        @rental_log = {}
    end

    def rent(boat, renter)
        boat.rent
        @rental_log[boat] = renter
    end

    def charge(boat)
        charge_hash = {}
        charge_hash[:card_number] = @rental_log[boat].credit_card_number
        charge_hash[:amount] = boat.price_per_hour * boat.hours_rented.clamp(0,3)
        charge_hash
    end

    def return(boat)
        boat.return
    end

    def revenue
        rev = 0
        @rental_log.each do |boat, renter|
            if boat.rented? == false
                rev += boat.price_per_hour * boat.hours_rented.clamp(0,3)
                rev
            end
        end
        rev
    end

    def log_hour
        @rental_log.each do |boat, renter|
            if boat.rented? == true
                boat.add_hour
            end
        end
    end

    #issues I would fix if it was a project
    #and not just an assignment (followed directions,
    #but directions don't address this)
    #need to reset hours after payment
    #need to be able to reference charge hash history 
    #even after reset 
    #revenue usually would be a running total
   


end