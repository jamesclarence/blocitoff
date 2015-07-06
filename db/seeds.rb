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
    created_at: Faker::Date.between(7.days.ago, Date.today),
    body: "#{i} #{Faker::Lorem.sentence} #{100 - i}"
    )
end

# Create a member
member = User.new(
    name:       'Member User',
    email:      'member@example.com',
    password:   'helloworld'
)
member.skip_confirmation!
member.save!

puts "Total Items: #{Item.count}"
puts "Seed finished successfully."