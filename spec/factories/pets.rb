module FactoryHelpers
  extend self

  def random_name
    ('a'..'z').to_a.shuffle.join[0,8]
  end 

  def random_gender
    if (rand 2) == 1
      "Female"
    else
      "Male"
    end
  end

  def random_species
    key = rand 5
    case key
      when 0
        "Dog"
      when 1
        "Cat"
      when 2
        "Bird"
      when 3
        "Reptile"
      when 4
        "Small Rodent"
      when 5
        "Other"
    end
  end

  def random_weight
    key = rand 4
    case key
      when 0
        "Under 25 lbs "
      when 1
        "25-50 lbs"
      when 2
        "50-75 lbs"
      when 3
        "75+ lbs"
    end
  end

  def random_age
    key = rand 4
    case key
      when 0
        "Young"
      when 1
        "Adult"
      when 2
        "Senior"
      when 3
        "Unknown"
    end
  end
end

FactoryGirl.define do
  factory :pet do
    name {"Pet " + FactoryHelpers.random_name}
    age {FactoryHelpers.random_age}
    details "Sample Description"
    gender {FactoryHelpers.random_gender}
    species {FactoryHelpers.random_species}
    weight {FactoryHelpers.random_weight}
  end
end
