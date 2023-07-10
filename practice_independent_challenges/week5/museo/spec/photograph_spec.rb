require './lib/photograph.rb'

RSpec.describe do Photograph
    it 'exists' do
        attributes = {
        id: "1",
        name: "Rue Mouffetard, Paris (Boy with Bottles)",
        artist_id: "4",
        year: "1954"
        }     
        
        photograph = Photograph.new(attributes)

        expect(photograph).to be_an_instance_of(Photograph)
    end

    it 'has attributes' do
        attributes = {
            id: "1",
            name: "Rue Mouffetard, Paris (Boy with Bottles)",
            artist_id: "4",
            year: "1954"
            }     
            
            photograph = Photograph.new(attributes)

            expect(photograph.id).to eq("1")
            expect(photograph.name).to eq "Rue Mouffetard, Paris (Boy with Bottles)"
            expect(photograph.year).to eq "1954"
            
        end
end

