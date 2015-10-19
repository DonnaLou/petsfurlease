FactoryGirl.define do
  factory :pet do

    trait :owner_1 do
      profile_id 1
      species "dog"
    end

    trait :owner_2 do
      profile_id 2
      species "dog"
    end

    trait :owner_3 do
      profile_id 2
      species "cat"
    end
  end
end
