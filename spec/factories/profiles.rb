module FactoryHelpers
  extend self
  def random_name
    ('a'..'z').to_a.shuffle.join[0,7]
  end  

  def random_zip
    zips = %w(92126 92122 92127 92130 92128 92064)
    zips[rand zips.count]
  end
end

FactoryGirl.define do
  factory :profile do
    firstName "User "
    lastName {FactoryHelpers.random_name}
    city "San Diego"
    state "CA"
    description "Sample Text"
    zip {FactoryHelpers.random_zip}
    is_volunteer true
  end
end
 