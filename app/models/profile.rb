class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :pets
	has_many :reviews
	
	validates :firstName, :lastName, presence: true
	validates :zip, length: {is: 5}

 	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "wireframeImage.png"
  	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  
	def self.search(zip: zip)
		query = Profile.all
		query = query.where(zip: zip) unless zip.blank?

		query.to_a
	end

	def full_name
		return firstName + " " + lastName
	end

end
