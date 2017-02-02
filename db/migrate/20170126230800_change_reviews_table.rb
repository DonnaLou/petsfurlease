class ChangeReviewsTable < ActiveRecord::Migration
  def change
  	remove_column :reviews, :profile_id, :integer
  	remove_column :reviews, :pet_id, :integer
  	add_reference :reviews, :review_subject, polymorphic: true
  end
end
