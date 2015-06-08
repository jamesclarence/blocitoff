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
users = User.all

# admin = User.new(
#   name: 'Admin User',
#   email: 'admin@example.com',
#   password: 'helloworld'
#   role: 'admin' 
# )
# admin.skip_confirmation!
# admin.save!

puts "Seed finished"
puts "#{User.count} users created."