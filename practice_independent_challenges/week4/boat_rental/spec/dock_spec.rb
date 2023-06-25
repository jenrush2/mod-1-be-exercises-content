require 'rspec'
require './lib/boat'
require './lib/renter'
require './lib/dock'

RSpec.describe Dock do
    it 'exists' do
        dock = Dock.new("The Rowing Dock", 3) 

        expect(dock).to be_an_instance_of Dock
    end

    it 'has attributes' do
        dock = Dock.new("The Rowing Dock", 3) 

        expect(dock.name).to eq "The Rowing Dock"
        expect(dock.max_rental_time).to eq 3
    end

    it 'can rent boats' do
        dock = Dock.new("The Rowing Dock", 3) 

        expect(dock.rental_log).to eq({})

        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313") 

        dock.rent(kayak_1, patrick)
        dock.rent(kayak_2, patrick)
        dock.rent(sup_1, eugene)

        expect(kayak_1.rented?).to eq true
        expect(kayak_2.rented?).to eq true
        expect(sup_1.rented?).to eq true

        expect(dock.rental_log).to eq({kayak_1 => patrick, kayak_2 => patrick, sup_1 => eugene})
    end

    it 'can charge renters' do
        dock = Dock.new("The Rowing Dock", 3) 

        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313") 

        dock.rent(kayak_1, patrick)
        dock.rent(kayak_2, patrick)
        dock.rent(sup_1, eugene)

        kayak_1.add_hour
        kayak_1.add_hour

        5.times{kayak_2.add_hour}

        2.times{sup_1.add_hour}


        expect(dock.charge(kayak_1)).to eq({:card_number => "4242424242424242", :amount => 40})
        expect(dock.charge(kayak_2)).to eq({:card_number => "4242424242424242", :amount => 60})
        expect(dock.charge(sup_1)).to eq({:card_number => "1313131313131313", :amount => 30})

    end

    it 'can return boats to the dock' do
        dock = Dock.new("The Rowing Dock", 3) 

        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313") 

        dock.rent(kayak_1, patrick)
        dock.rent(kayak_2, patrick)
        dock.rent(sup_1, eugene)

        kayak_1.add_hour
        kayak_1.add_hour

        5.times{kayak_2.add_hour}

        2.times{sup_1.add_hour}

        dock.return(kayak_1)
        dock.return(sup_1)

        expect(kayak_1.rented?).to eq false
        expect(sup_1.rented?).to eq false
        expect(kayak_2.rented?).to eq true

    end

    it 'can calculate revenue of returned boats' do
        dock = Dock.new("The Rowing Dock", 3) 

        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313") 

        dock.rent(kayak_1, patrick)
        dock.rent(kayak_2, patrick)
        dock.rent(sup_1, eugene)

        kayak_1.add_hour
        kayak_1.add_hour

        5.times{kayak_2.add_hour}

        2.times{sup_1.add_hour}

        dock.return(kayak_1)
        dock.return(sup_1)

        expect(dock.revenue).to eq 70
    end

    it 'can log an additonal hour to rented boats' do
        dock = Dock.new("The Rowing Dock", 3) 

        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313") 

        dock.rent(kayak_1, patrick)
        dock.rent(kayak_2, patrick)
        dock.rent(sup_1, eugene)

        kayak_1.add_hour
        kayak_1.add_hour

        5.times{kayak_2.add_hour}

        2.times{sup_1.add_hour}

        dock.return(kayak_1)
        dock.return(sup_1)

        dock.log_hour

        expect(kayak_1.hours_rented).to eq 2
        expect(kayak_2.hours_rented).to eq 6
    end




       
end