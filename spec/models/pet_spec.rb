require 'rails_helper'

TOTAL_PET_COUNT = 7

RSpec.describe Pet, type: :model do
  before :each do
    # One time setup
    create(:profile, :profile_92104)
    create(:profile, :profile_92128)

    # Create 3 dogs owned by profile_92104 (spec/factories.pets.rb)
    3.times {|i| create(:pet, :owner_1)}

    # Create 2 dogs owned by profile_92128 (spec/factories/pets.rb)
    2.times {|i| create(:pet, :owner_2)}

    # Create 2 cats owned by profile_92128 (spec/factories/pets.rb)
    2.times {|i| create(:pet, :owner_3)}
  end

  context "when searching for pets" do
    it "searches for pets with no params" do
      pets = Pet.search

      expect(pets.count).to eq(TOTAL_PET_COUNT)
    end

    it "searches for pets in zipcode" do
      pets = Pet.search(zip: '92104')

      expect(pets.length).to eq(3)
    end
    
    it "searches for pets with species only" do
      pets = Pet.search(species: 'dog')

      expect(pets.count).to eq(5)
    end

    it "searches for pets with zipcode and species" do
      pets = Pet.search(zip: '92104', species: 'dog')

      expect(pets.count).to eq(3)
    end

    it "returns 0 results when no records match" do
      pets = Pet.search(zip: '92104', species: 'cat')

      expect(pets.count).to eq(0)
    end
  end
end
