require 'faker'

# Create Users
20.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

unless User.find_by_email 'admin@example.com'
  admin = User.new(
    name: 'Admin User',
    email: 'admin@example.com',
    password: 'helloworld',
    role: 'admin' 
  )
  admin.skip_confirmation!
  admin.save!
  puts "admin user created."
end
users = User.all

puts "Total Users: #{users.count}"

# Create Items
100.times do |i|
  item = Item.create!(
    user: users.sample,
    body: "#{i} #{Faker::Lorem.sentence} #{100 - i}"
    )
end
puts "Total Items: #{Item.count}"
puts "Seed finished successfully."