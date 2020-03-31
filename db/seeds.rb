# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Movie.delete_all

10_000.times do
  Movie.create({title: Faker::FunnyName.name, description: Faker::Superhero.descriptor, director: Faker::Name.name })
end

Person.delete_all

10_000.times do
  Person.create!(
    name: Faker::Name.name,
    birth_date: Faker::Date.birthday,
    hobbies: rand(5..10).times.map { Faker::Job.key_skill },
    job: Faker::Job.title,
    skills: rand(3..5).times.map { Faker::Job.key_skill },
    favourite_quote: Faker::Lorem.sentence,
    avatar: Faker::Avatar.image,
    bio: {
      gereral: Faker::Lorem.paragraph,
      education: Faker::University.name,
      professional: Faker::Lorem.paragraph,
      personal: Faker::Lorem.paragraph,
    },
    favourite_books: rand(10..20).times.map { Faker::Book.title },
    favourite_authors: rand(5..10).times.map { Faker::Book.author },
  )
end
