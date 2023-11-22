# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "Clearing db..."
Boat.destroy_all
Booking.destroy_all
User.destroy_all
puts "DB cleared"


puts "Creating user"
user = User.create!(email:"fsfa@gmail.com",  password: "123456")
puts "User Created"

puts "Creating Boat"
file = URI.open("https://images.unsplash.com/photo-1605281317010-fe5ffe798166?q=80&w=2044&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
boat = Boat.new(location:"Atlantis", name: "Ariel", capacity: 5, price: 300, user_id: user.id)
boat.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
boat.save

puts "Boat created"

puts "-------------- DB now Seeded ----------------"
