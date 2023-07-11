require './lib/photograph.rb'
require './lib/artist.rb'
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

    def photos_from_years(begin_year, end_year)
        photographs.reduce([]) do |final_list, photograph|
            if (begin_year.to_i..end_year.to_i).include?(photograph.year.to_i) == true
                final_list << photograph
                final_list
            else
                final_list
            end
            final_list
        end
    end

    def artist_age_match(starting_photo_name)
        starting_photograph = photographs.find{|photograph| photograph.name == starting_photo_name}
        artist = artists.find{|artist| artist.id == starting_photograph.artist_id}
        age_of_artist = (starting_photograph.year.to_i - artist.born.to_i).to_s
        #array_of_same_year_photographs = photographs.find_all{|photograph| photograph.artist_id == artist.id}
        array_of_same_year_photographs = photographs.reduce([]) do |array, photograph|
            if photograph.artist_id == artist.id and photograph.name != starting_photo_name and photograph.year == starting_photograph.year
                array << photograph
                array
            end
            array
        end

        if array_of_same_year_photographs.length == 0
            statement = "#{artist.name} was #{age_of_artist} years old and took no other photos that year."
            statement
        elsif array_of_same_year_photographs.length == 1
            statement = "#{artist.name} was #{age_of_artist} years old and took '#{array_of_same_year_photographs[0].name}' in that same year."
            statement
        elsif array_of_same_year_photographs.length > 1
            other_photos_names = array_of_same_year_photographs.reduce("") do |string, photograph|
                if string == ""
                    string.concat("'#{photograph.name}'")
                else
                string.concat(" and '#{photograph.name}'")
                end
            end
            statement = "#{artist.name} was #{age_of_artist} years old and took #{other_photos_names} in that same year."
            statement
        else
            statement = "Error. Please try your request again."
            statement
        end

        statement

    end 



end