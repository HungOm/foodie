# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
    # ps = User.digest(Faker::Internet.password(min_length:7))
    user = User.create(name:Faker::Name.name,email:Faker::Internet.email, password:123456)
    if !user.valid?
        puts "#{user.errors.messages} is not created"
    end

    food = Food.create(name:Faker::Food.dish,price:rand(11.2...76.9),ingredients:Faker::Food.ingredient,description:Faker::Food.description)
    if !food.valid?
        puts "#{food.errors.messages} is not created"
    end
    
end