# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = {}
ActiveRecord::Base.transaction do
  30.times do 
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
    product[:active] = true
  	product['user_id'] = uids.sample

  	Product.create(product)
  end
end

Order.delete_all


# Product.delete_all
# Product.create! id: 1, name: "Banana", price: 0.49, active: true
# Product.create! id: 2, name: "Apple", price: 0.29, active: true
# Product.create! id: 3, name: "Carton of Strawberries", price: 1.99, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"


