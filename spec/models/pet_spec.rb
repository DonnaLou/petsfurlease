require 'rails_helper'

RSpec.describe Pet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "creates a new pet" do
    exp_name = 'Penny'
    exp_deets = 'Test description'
    exp_breed = 'Pit bull mix'
    exp_age = 3;

		pet = Pet.new
		pet.name = "Penny"
		pet.details = "Test description"
		pet.breed = "Pit bull mix"
		pet.age = 3

    expect(pet.name).to eq(exp_name)
    expect(pet.details).to eq(exp_deets)
    expect(pet.breed).to eq(exp_breed)
    expect(pet.age).to eq(exp_age)
  end
end
