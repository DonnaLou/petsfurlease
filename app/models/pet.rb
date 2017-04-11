class Pet < ActiveRecord::Base
  belongs_to :profile
  belongs_to :review_subject, polymorphic: true

  validates :profile_id, presence: true
  validates :name, presence: {message: "Pet Name is required."}
  validates :species, presence: {message: "Animal Type is required."}
  validates :gender, presence: {message: "Gender is required."}
  validates :weight, presence: {message: "Weight is required."}
  validates :age, presence: {message: "Age is required."}
  validates :details, presence: {message: "Description is required."}
  validate :validate_helper_dates

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

  def full_name
    self.name
  end

  def validate_helper_dates
    if !helpWanted
      return true
    elsif helpWanted && helpStartDate && helpEndDate
      return true
    else
      errors[:helpWanted] << "Help Dates are required."
    end
  end


end
