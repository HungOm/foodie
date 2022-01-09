# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'uri'
require 'net/http'

uri = URI('https://foodish-api.herokuapp.com/api/')


print("Seeding plants ...\n")
# create admin 
User.create(name:'Om',email:'om@gmail.com',password:123456, user_type:1)
# creat normal user 
User.create(name:'Om1',email:'om1@gmail.com',password:123456, user_type:0)
Food.create(name:Faker::Food.dish,price:rand(11.2...76.9),ingredients:Faker::Food.ingredient,description:Faker::Food.description)


20.times do
    puts "Fetching image\n"
    res = Net::HTTP.get_response(uri)
    image_url=JSON.parse(res.body, symbolize_names: true) if res.is_a?(Net::HTTPSuccess)

    puts "Done fetching new food image\n"

    # ps = User.digest(Faker::Internet.password(min_length:7))
    user = User.create(name:Faker::Name.name,email:Faker::Internet.email, password:123456)
    if !user.valid?
        puts "#{user.errors.messages} is not created"
    end

    puts " "
    puts "-----------------User created -------------------"
    puts " "



    # linek =

    food = Food.create(name:Faker::Food.dish,price:rand(11.2...76.9),ingredients:Faker::Food.ingredient,description:Faker::Food.description,menu_status:1,image_url:image_url[:image])
    if !food.valid?
        puts "#{food.errors.messages} is not created"
    end

    puts "-----------------Food created -------------------"
    
end
puts " "
puts "================== db planting completed ==============\n"
puts " "
