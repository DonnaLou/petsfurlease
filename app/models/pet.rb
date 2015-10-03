class Pet < ActiveRecord::Base
  #validates :user_id, 
   # :name, 
    #:species, 
    #:breed, 
    #:age, 
    #presence: true

  belongs_to :profile
end
