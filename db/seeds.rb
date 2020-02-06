# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Stroll.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
City.destroy_all

#CITIES : 
#The use of the faker gem in order to have random  adresses 
#I separate this loop from dogs and dogsitters in order to have 20 cities before selecting them for each dogs and dogsitters
a = 0
20.times do 
    a += 1
    City.create(id: a, city_name: Faker::Address.city)
end

#DOGS AND DOGSITTERS : 
#I randomize the city 
b = 0
20.times do
    b += 1
    Dog.create(id: b, name: Faker::Name.first_name, city: City.find(rand(1..20)))
    Dogsitter.create(id: b, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.find(rand(1..20)))
end

#STROLLS
# I randomize the dog and dogsitter
c = 0
20.times do 
    c += 1
    Stroll.create(id: c, dog: Dog.find(rand(1..20)), dogsitter: Dogsitter.find(rand(1..20)))
end

puts "load of cities, dogs, dogsitters and strolls (the join table between dogs and dogsitters)"