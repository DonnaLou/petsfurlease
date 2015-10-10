# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pets = Pet.create(
  [{
    name: 'Roger',
    species: 'other',
    breed: 'Alien',
    age: 'senior',
    details: 'Lives in the attic with the Smith family.',
    weight: '75+',
    gender: 'other',
    profile_id: 4}
  ])
