class User
  attr_reader :email,
              :image_generator,
              :id,
              :image_generator_objects
              :image_history


  def initialize(email, image_generator)
    @email = email
    @image_generator = image_generator
    @profile_image = nil
    @id = rand(100000)
    @image_history = []
  end

  #added because couldn't test without it...
  def image_history
    @image_history
  end

  def change_id_via_user_input
    @id = get_user_input
  end

  def get_user_input
    gets.chomp.to_i
  end

  #why does it say add image generators
  #when it adds an image to history?
  #typo from Turing?
  def add_image_generators(image)
    @image_history << image
  end

  def create_images
    @image_generator.generate_images
  end

  def assign_new_random_image
    @profile_image = random_image
    add_image_history(image)
    #where does the image variable come from 
    #in this method? 
    #Is it a reference to random_image instead?
  end

  def random_image
    @image_generator.generate_images.sample
  end
end
