require 'rspec'
require './lib/image_generator'

RSpec.describe ImageGenerator do
  describe '#initialize' do
    it 'exists' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator).to be_a ImageGenerator
    end

    it 'has attributes' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator.max_image_size).to eq 2500
    end

    # Using stubs write the tests to confirm the functionality
    # that exists in ./lib/image_generator.rb
    #generate images and change max size

    it 'can generate images' do
      image_generator = ImageGenerator.new(5)
      allow(image_generator).to receive(:rand).and_return(1)
      
      expect(image_generator.generate_images).to eq(["image0"])


    end

    it 'can change max size' do
      image_generator = ImageGenerator.new(100)

      expect(image_generator.max_image_size).to eq(100)

      allow(image_generator).to receive(:rand).and_return(1)

      image_generator.change_max_size(2)

      expect(image_generator.max_image_size).to eq(2)


    end

  end
end
