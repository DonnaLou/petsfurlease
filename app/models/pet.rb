class Pet < ActiveRecord::Base
  validates :user_id, 
    :name, 
    :species, 
    :breed, 
    :age, 
    :human_interaction_rating, 
    :animal_interaction_rating, 
    :personality, 
    presence: true

  belongs_to :user
end
