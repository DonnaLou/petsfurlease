class Pet < ActiveRecord::Base
  validates :profile_id, 
    :name, 
    :species, 
    :breed, 
    :age, 
    :details,
    presence: true

  belongs_to :profile

  def self.search(zip: '', species: '') 
		query = Profile.search(zip: zip)
    
    query.inject([]) do |acc, profile|
      pets = profile.pets
      pets = profile.pets.where(species: species) unless species.blank?
      acc.concat(pets)
      acc
    end
  end

  def zip
    self.profile.zip
  end
end
