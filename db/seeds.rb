# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy
user = {}
ActiveRecord::Base.transaction do
  35.times do 
    user['full_name'] = Faker::Name.first_name 
    user['email'] = Faker::Internet.email
    user['contact'] = Faker::PhoneNumber.cell_phone
    user['password'] = '123123'
    User.create(user)
  end
end 

Product.destroy
product = {}
uids = []
User.all.each { |u| uids << u.id }
ActiveRecord::Base.transaction do
  40.times do |t|
  	product[:title] = Faker::App.name
  	product[:type_of_condition] = [true, false].sample
    product[:area] = rand(0..4)
  	product[:category_type] = rand(0..6)
  	product[:price] = rand(80..500)
  	product[:location] = Faker::Address.street_address
    product[:active] = true
    product[:contact] = "010-12348239"
    product[:address] = Faker::Address.street_address
  	product['user_id'] = uids.sample
  	Product.create(product)
  end
end

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

Order.delete_all
order = {}
ActiveRecord::Base.transaction do
  25.times do |t|
    order[:subtotal] = rand(80..500)
    order['order_status_id'] = 1
    Order.create(order)
  end
end

# Product.delete_all
# Product.create! id: 1, name: "Banana", price: 0.49, active: true
# Product.create! id: 2, name: "Apple", price: 0.29, active: true
# Product.create! id: 3, name: "Carton of Strawberries", price: 1.99, active: true




