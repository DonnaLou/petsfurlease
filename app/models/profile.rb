class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :pets
	belongs_to :review_subject, polymorphic: true
	
	validates :firstName, presence: {message: "First Name is required."}
	validates :lastName, presence: {message: "Last Name is required."}
	validates :city, presence: {message: "City is required."}
	validates :state, presence: {message: "State is required."}
	validates :description, presence: {message: "Bio is required."}
	validates :zip, length: {is: 5, message: "Zipcode should be 5 digits."}

 	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "wireframeImage.png"
  	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']

	def full_name
		return firstName + " " + lastName
	end

	def reviews
		Review.where(review_subject: self)
	end

	def reviews_authored
		Review.where(user: self)
	end

	def pet_reviews_count
		count = 0
		self.pets.each do |p|
			count += p.reviews.count
		end
		return count
	end


end
