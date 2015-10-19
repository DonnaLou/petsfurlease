require 'rails_helper'

RSpec.describe Pet, type: :model do
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
    expect(pet.age.to_i).to eq(exp_age)
  end

  it "searches for pets with no params" do
    create(:profile, :profile_92104)
    3.times {|i| create(:pet, :owner_1)}

    pets = Pet.search

    expect(pets.count).to eq(3)
  end

  it "seraches for pets across profiles with no params" do
    create(:profile, :profile_92104)
    create(:profile, :profile_92128)

    3.times { |i| create(:pet, :owner_1)}
    2.times { |i| create(:pet, :owner_2)}

    pets = Pet.search

    expect(pets.count).to eq(5)
  end

  it "searches for pets in zipcode" do
    create(:profile, :profile_92104)
    create(:profile, :profile_92128)

    3.times {|i| create(:pet, :owner_1)}
    2.times {|i| create(:pet, :owner_2)}

    pets = Pet.search(zip: '92104')

    expect(pets.length).to eq(3)
  end
  
  it "searches for pets with species only" do
    create(:profile, :profile_92104)
    create(:profile, :profile_92128)

    3.times {|i| create(:pet, :owner_1)}
    2.times {|i| create(:pet, :owner_2)}
    2.times {|i| create(:pet, :owner_3)}

    pets = Pet.search(species: 'dog')

    expect(pets.count).to eq(5)
  end

  it "searches for pets with zipcode and species" do
    create(:profile, :profile_92104)
    create(:profile, :profile_92128)

    3.times {|i| create(:pet, :owner_1)}
    2.times {|i| create(:pet, :owner_2)}
    2.times {|i| create(:pet, :owner_3)}

    pets = Pet.search(zip: '92104', species: 'dog')

    expect(pets.count).to eq(3)
  end

  it "returns 0 results when no records match" do
    create(:profile, :profile_92104)
    create(:profile, :profile_92128)

    3.times {|i| create(:pet, :owner_1)}
    2.times {|i| create(:pet, :owner_2)}
    2.times {|i| create(:pet, :owner_3)}

    pets = Pet.search(zip: '92104', species: 'cat')

    expect(pets.count).to eq(0)
  end
end
