require './lib/photograph.rb'
require './lib/artist.rb'
require './lib/curator.rb'
require 'CSV'

RSpec.describe do Curator 
    it 'exists' do
        curator = Curator.new

        expect(curator).to be_an_instance_of(Curator)
    end

    it 'begins with no photographs' do
        curator = Curator.new

        expect(curator.photographs).to eq ([])
    end

    it 'can add a photograph' do
        curator = Curator.new

        photo_1 = Photograph.new({
        id: "1",      
        name: "Rue Mouffetard, Paris (Boy with Bottles)",      
        artist_id: "1",      
        year: "1954"      
        }) 
        
        photo_2 = Photograph.new({
        id: "2",      
        name: "Moonrise, Hernandez",      
        artist_id: "2",      
        year: "1941"      
        })  

        curator.add_photograph(photo_1)
        curator.add_photograph(photo_2)

        expect(curator.photographs).to eq([photo_1, photo_2])
    end

    it 'starts with no artists' do 
        curator = Curator.new

        expect(curator.artists).to eq([])
    end

    it 'can add artists' do
        curator = Curator.new

        artist_1 = Artist.new({
        id: "1",      
        name: "Henri Cartier-Bresson",      
        born: "1908",      
        died: "2004",      
        country: "France"      
        })     
        
        artist_2 = Artist.new({
        id: "2",      
        name: "Ansel Adams",      
        born: "1902",      
        died: "1984",      
        country: "United States"      
        })   
        
        curator.add_artist(artist_1)
        curator.add_artist(artist_2)

        expect(curator.artists).to eq([artist_1, artist_2])
    end

    it 'can find an artist by their artist id' do
        curator = Curator.new

        artist_1 = Artist.new({
        id: "1",      
        name: "Henri Cartier-Bresson",      
        born: "1908",      
        died: "2004",      
        country: "France"      
        })     
        
        artist_2 = Artist.new({
        id: "2",      
        name: "Ansel Adams",      
        born: "1902",      
        died: "1984",      
        country: "United States"      
        })   
        
        curator.add_artist(artist_1)
        curator.add_artist(artist_2)

        expect(curator.find_artist_by_id("1")).to eq(artist_1)
    end

    it 'can return a list of all artists and their photographs' do
        curator = Curator.new

        artist_1 = Artist.new({
        id: "1",      
        name: "Henri Cartier-Bresson",      
        born: "1908",      
        died: "2004",      
        country: "France"      
        })     
        
        artist_2 = Artist.new({
        id: "2",      
        name: "Ansel Adams",      
        born: "1902",      
        died: "1984",      
        country: "United States"      
        })   
        
        curator.add_artist(artist_1)
        curator.add_artist(artist_2)

        photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
            }) 
            
        photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
            })  

        photo_3 = Photograph.new({
            id: "3",      
            name: "Some cool photo",      
            artist_id: "2",      
            year: "1943"      
            }) 
    
        curator.add_photograph(photo_1)
        curator.add_photograph(photo_2)
        curator.add_photograph(photo_3)

        expect(curator.list_all).to eq({artist_1 => [photo_1], artist_2 => [photo_2, photo_3]})
    end

    it 'can list names of artists with more than one photograph' do
        curator = Curator.new

        artist_1 = Artist.new({
        id: "1",      
        name: "Henri Cartier-Bresson",      
        born: "1908",      
        died: "2004",      
        country: "France"      
        })     
        
        artist_2 = Artist.new({
        id: "2",      
        name: "Ansel Adams",      
        born: "1902",      
        died: "1984",      
        country: "United States"      
        })   
        
        curator.add_artist(artist_1)
        curator.add_artist(artist_2)

        photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
            }) 
            
        photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
            })  

        photo_3 = Photograph.new({
            id: "3",      
            name: "Some cool photo",      
            artist_id: "2",      
            year: "1943"      
            }) 
    
        curator.add_photograph(photo_1)
        curator.add_photograph(photo_2)
        curator.add_photograph(photo_3)

        expect(curator.artist_with_multiple_photographs).to eq([artist_2.name])

    end

    it 'can create a list of photographs from any photographer from a certain country' do
        curator = Curator.new

        artist_1 = Artist.new({
        id: "1",      
        name: "Henri Cartier-Bresson",      
        born: "1908",      
        died: "2004",      
        country: "France"      
        })     
        
        artist_2 = Artist.new({
        id: "2",      
        name: "Ansel Adams",      
        born: "1902",      
        died: "1984",      
        country: "United States"      
        })   
        
        curator.add_artist(artist_1)
        curator.add_artist(artist_2)

        photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
            }) 
            
        photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
            })  

        photo_3 = Photograph.new({
            id: "3",      
            name: "Some cool photo",      
            artist_id: "2",      
            year: "1943"      
            }) 
    
        curator.add_photograph(photo_1)
        curator.add_photograph(photo_2)
        curator.add_photograph(photo_3)

        expect(curator.country_list("United States")).to eq([photo_2, photo_3])
    end

    xit 'can get photographs from a csv' do
        curator = Curator.new

        p curator.get_photos_from_csv('data/photographs.csv')
        p curator.photographs

        expect(curator.get_photos_from_csv('data/photographs.csv')).to be_an_instance_of Array
        expect(curator.get_photos_from_csv('data/photographs.csv')[0]).to be_an_instance_of Photograph 
        expect(curator.photographs).to be_an_instance_of Array
        expect(curator.photographs[1]).to be_an_instance_of Photograph

        expect(curator.photographs[4].name).to eq("Some cool photo")

    end

    xit 'can get artists from a csv' do
        curator = Curator.new

        p curator.get_artists_from_csv('data/artists.csv')
        p curator.artists

        expect(curator.get_artists_from_csv('data/artists.csv')).to be_an_instance_of Array
        expect(curator.get_artists_from_csv('data/artists.csv')[0]).to be_an_instance_of Artist

        expect(curator.get_artists_from_csv('data/artists.csv')[5].id).to eq("6")
    end

    it 'can give a list of all photographs taken in a year that falls in a range' do
        curator = Curator.new

        curator.get_photos_from_csv('data/photographs.csv')
        curator.get_artists_from_csv('data/artists.csv')

        #expect(curator.photos_from_years("1940" , "1955")).to eq("check for photograph 1 and 2")
        expect(curator.photos_from_years("1940" , "1955")).to be_an_instance_of Array
        expect(curator.photos_from_years("1940" , "1955")[0]).to be_an_instance_of Photograph 


    end

    it 'can receive a photograph and give artist age when taken and all photographs taken at that age' do
        curator = Curator.new

        curator.get_photos_from_csv('data/photographs.csv')
        curator.get_artists_from_csv('data/artists.csv')

        expect(curator.artist_age_match("Some other photo")).to eq("Diane Arbus was 44 years old and took 'Identical Twins, Roselle, New Jersey' in that same year.")
    end

    







end
