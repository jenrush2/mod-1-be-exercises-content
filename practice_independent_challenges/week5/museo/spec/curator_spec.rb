require './lib/photograph.rb'
require './lib/artist.rb'
require './lib/curator.rb'

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




end
