require './photograph.rb'
require './artist.rb'

class Curator
    attr_accessor :photographs, :artists

    def initialize
        @photographs = []
        @artists = []
    end

    def add_photograph(photograph)
        photographs << photograph
        photographs
    end

    def add_artist(artist)
        artists << artist
        artists
    end

    def find_artist_by_id(id_to_lookup)
        artists.find {|artist| artist.id == id_to_lookup}
    end

    def list_all
        list = {}
        artists.each do |artist|
            list[artist] = photographs.find_all {|photograph| photograph.artist_id == artist.id}
            list
        end
        list
    end


end