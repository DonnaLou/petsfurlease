class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :pets
	
	validates :firstName, presence: true
	validates :lastName, presence: true
	validates :zip, length: {is: 5}

	def self.search(zip: zip)
		query = Profile.all
		query = query.where(zip: zip) unless zip.blank?

		query.to_a
	end
end
