# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

johannes = User.create!(
  email: 'jonnyfoerster@gmail.com',
  password: 'stinkysocks',
  username: 'johannes'
)
10.times do
  place = Place.create!(
    name: 'beigel master',
    category: ['food', 'nightlife', 'activities', 'shopping', 'services'].sample,
    summary: 'good beigel', description: 'this bagel really slaps',
    address: Faker::Address.street_address,
    user: johannes
  )
  puts place.name
end

beigel = Place.create!(
  name: 'bakery',
  category: 'food',
  summary: 'best beigel in town', description: 'this pne is better',
  address: '159 Brick Ln, London E1 6SB',
  user: johannes
)

puts beigel.name
