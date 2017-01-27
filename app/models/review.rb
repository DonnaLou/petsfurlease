class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :review_subject, polymorphic: :true

	validates :user, :rating, :details, :review_subject, presence: true
	validates :rating, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 5}
end
