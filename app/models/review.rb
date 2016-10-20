class Review < ActiveRecord::Base
	has_one :profile
	has_one :pet
	belongs_to :user

	validates :user, :rating, presence: true
	validates :rating, numericality: {only_integer: true, greater_than: 0, less_than: 5}
end
