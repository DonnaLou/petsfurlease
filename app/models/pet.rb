class Pet < ActiveRecord::Base
  #validates :user_id, 
   # :name, 
    #:species, 
    #:breed, 
    #:age, 
    #presence: true

  belongs_to :profile

  def self.search(zip = '') 
    query = Profile.all
    query = query.where(zip: zip) unless zip.blank?
    
    query.inject([]) do |acc, profile|
      acc.concat profile.pets
      acc
    end
  end

  def zip
    self.profile.zip
  end
end
