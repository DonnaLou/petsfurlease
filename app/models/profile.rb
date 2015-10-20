class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :pets

	def self.search(zip: zip)
		query = Profile.all
		query = query.where(zip: zip) unless zip.blank?

		query.to_a
	end
end
