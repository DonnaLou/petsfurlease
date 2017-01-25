FactoryGirl.define do
  sequence(:petName) {|n| "pet #{n}"}    

  factory :pet do
    name {generate(:petName)}
    age "Adult"
    details "Sample Description"
    gender "Female"

    trait :small_rodent_92126 do
      profile Profile.find_by(zip: '92126')
      species "Small Rodent"
    end

    trait :reptile_92126 do
      profile Profile.find_by(zip: '92126')
      species "Reptile"
    end

    trait :bird_92128 do
      profile Profile.find_by(zip: '92128')
      species "Reptile"
    end

    trait :dog_92128 do
      profile Profile.find_by(zip: '92128')
      species "Dog"

    end

    trait :cat_92130 do
      profile Profile.find_by(zip: '92130')
      species "Cat"
    end

    trait :other_92130 do
      profile Profile.find_by(zip: '92130')
      species "Other"
    end
  end
end
