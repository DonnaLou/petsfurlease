class Review < ActiveRecord::Base
	has_one :profile
	has_one :pet
	has_one :user

	validates :user, :rating, prescence: true
	validate :rating, numericality: {only_integer: true, greater_than: 0, less_than: 6}
end
