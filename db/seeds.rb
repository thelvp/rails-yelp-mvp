puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

require "faker"

5.times do |i|
  Restaurant.create(
  name: Faker::Restaurant.name,
   address: Faker::Address.street_address,
   phone_number: Faker::PhoneNumber.phone_number,
   category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
  )
end

puts "#{Restaurant.count} created."
