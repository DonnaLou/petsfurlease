class Pet < ActiveRecord::Base
  belongs_to :profile
  belongs_to :review_subject, polymorphic: true

  validates :profile_id, 
    :name, 
    :species, 
    :age, 
    :details,
    :gender,
    presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "wireframeImage.png"
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  
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

  def owned_by_user(user)
    return profile.user == user
  end

  def reviews
    Review.where(review_subject: self)
  end

end
