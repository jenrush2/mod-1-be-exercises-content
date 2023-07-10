require './photograph.rb'

class Artist
    attr_reader :id, :name, :born, :died, :country
    def initialize(args)
        @id = args[:id]
        @name = args[:name]
        @born = args[:born]
        @died = args[:died]
        @country = args[:country]
    end

    def age_at_death
        return died.to_i - born.to_i
    end

end