class Pet < ActiveRecord::Base
  #validates :user_id, 
   # :name, 
    #:species, 
    #:breed, 
    #:age, 
    #presence: true

  belongs_to :profile

  def self.search(zip: '', species: '') 
    query = Profile.all
    query = query.where(zip: zip) unless zip.blank?
    
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
