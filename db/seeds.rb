# frozen_string_literal: true

require 'faker'
puts 'Creating users'
10.times do
  #username = Faker::Internet.username
  #name = Faker::Name
  #email = Faker::Internet.email(name: username)

  User.create!(username: Faker::Internet.username,	email: Faker::Internet.email, password: '123456',	name: 'Juan',	location: 'Lima',	bio: 'test test')
end
