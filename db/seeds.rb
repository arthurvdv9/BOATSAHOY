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
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
boat = Boat.new(location:"Atlantis", name: "Ariel", capacity: 5, price: 300, user_id: user.id)
boat.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
boat.save

puts "Boat created"

puts "-------------- DB now Seeded ----------------"
