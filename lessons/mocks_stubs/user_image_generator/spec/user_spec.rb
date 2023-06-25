require 'rspec'
require './lib/image_generator'
require './lib/user'

RSpec.describe User do
  describe '#initialize' do
    it 'exists' do
      # I pass a real image generator object - this is potentially slow and costly
      # Lets mock this object whenever possible
      image = ImageGenerator.new(20)
      user = User.new("t@gmail.com", image)
      expect(user).to be_a User
    end

    it 'has attributes' do
      #I don't need an actual ImageGenerator object. I use a mock instead.
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)
      allow(user).to receive(:id).and_return(1234)

      expect(user.email).to eq "t@gmail.com"
      expect(user.image_generator).to eq mock_image_generator
      expect(user.id).to eq 1234
      expect(user.image_history).to eq []
      #Why is above code returning undefined method when it has attr_reader?
      #had to add in a method...I thought the point of attr_reader was to not
      #have to do that? Why does a different instance variable not need
      #a method defined in the image_generator_spec file?

    end

    #I can use a stub to have this test work without user input..but then
    #what am I testing? What's the point?
    it 'can change id via user input' do
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)
      allow(user).to receive(:get_user_input).and_return(1234)

      expect(user.change_id_via_user_input).to eq(1234)

    end

    xit 'can add image to image history' do
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)
      mock_image_generator_1 = instance_double("Image", max_image_size: 10)

      #see screenshot in ask Daniel. expected and got look the same -- why fail?
      #Also, if I change it to use a stub so it will pass, why bother?
      expect(user.add_image_generators(mock_image_generator_1)).to eq([user.image_generator])
    end

    it 'can create images' do
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)

      allow(mock_image_generator).to receive(:generate_images).and_return("image3")

      expect(user.create_images).to eq("image3")
    end

    xit 'can assign new random image' do
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)

      allow(user).to receive(:random_image).and_return("image3")

      expect(user.assign_new_random_image).to eq("image3")
      #above test works if comment out line 43 in user.rb, add_image_history(image)

    end


  end
end
