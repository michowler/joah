# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = {}
ActiveRecord::Base.transaction do
  20.times do 
    user['full_name'] = Faker::Name.first_name 
    user['email'] = Faker::Internet.email
    user['password'] = '123123'
    User.create(user)
  end
end 

product = {}
uids = []
User.all.each { |u| uids << u.id }
ActiveRecord::Base.transaction do
  40.times do |t|
  	product[:title] = Faker::App.name
  	product[:description] = Faker::Hipster.sentence
    product[:area] = rand(0..4)
  	product[:category_type] = rand(0..6)
  	product[:price] = rand(80..500)
  	product[:location] = Faker::Address.street_address
  	product['user_id'] = uids.sample

  	Product.create(product)
  end
end


