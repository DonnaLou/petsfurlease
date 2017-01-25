FactoryGirl.define do
  sequence(:firstName) {|n| "user #{n}"}
  sequence(:lastName){|n| "name #{n}"}   
  
  factory :profile do
    firstName {generate(:firstName)}
    lastName {generate(:lastName)}
    city "San Diego"
    state "CA"
    description "Sample Text"

    trait :profile_92130 do
      zip '92130'
      is_volunteer true
    end

    trait :profile_92128 do
      zip '92128'
      is_volunteer false
    end
  end
end
 