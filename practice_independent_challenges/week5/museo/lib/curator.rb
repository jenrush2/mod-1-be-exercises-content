require './photograph.rb'
require './artist.rb'
require 'CSV'

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

    def artist_with_multiple_photographs
        artists.reduce([]) do |list, artist|
            if list_all[artist].length > 1
                list << artist.name
                list
            else
                list
            end
            list
        end
    end

    def country_list(country_of_interest)
        photographs.reduce([]) do |list, photograph|
            artists_id_if_match = artists.reduce([]) do |new_array, artist|
                if artist.country == country_of_interest
                    new_array << artist.id
                    new_array
                else
                    new_array
                end 
                new_array
            end   

            if artists_id_if_match.include?(photograph.artist_id) == true  
                list << photograph
                list
            else
                list
            end
            list
        end
    end

    def get_photos_from_csv(csv_path)
        CSV.foreach(csv_path, :header_converters => :symbol, headers: true) do |row|
            photographs << Photograph.new(Hash[row.headers.zip(row.fields)])
            photographs
        end
        photographs
    end

    def get_artists_from_csv(csv_path)
        CSV.foreach(csv_path, :header_converters => :symbol, headers: true) do |row|
            artists << Artist.new(Hash[row.headers.zip(row.fields)])
            artists
        end
        artists
    end



end