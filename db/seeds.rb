require 'faker'

puts "Cleaning database..."
Apartment.destroy_all

puts "Creating apartments..."
# wreck = {name: "Wreck", address: "7 Boundary St, London E2 7JE", price: 180, square_meters: 15, description: "A wreck of an apartment, but cheap!"}
# tiffany =  {name: "Tiffany", address: "56A Shoreditch High St, London E1 6PQ", price: 350, square_meters: 50, description: "A Tiffany of an apartment - expensive, but worth it!"}

# [wreck, tiffany].each do |attributes|
#   apartment= Apartment.create!(attributes)

#   puts "Created #{apartment.name}"
# end

12.times do |i|
  apartment = Apartment.new(
  name: Faker::Coffee.blend_name,
  address: Faker::Address.street_address + ", " + Faker::Address.country,
  price: rand(1.0..50.0),
  square_meters: rand(10..150),
  description: Faker::Lorem.paragraph_by_chars,
  latitude: Faker::Address.latitude,
  longitude: Faker::Address.longitude
  )
  photo = File.open("app/assets/images/tent#{i + 1}.jpg")
  apartment.photo.attach(io: photo, filename: apartment.name, content_type: 'image/jpg')
  apartment.save!
  puts "Created #{apartment.name}"
end

puts "Finished!"


puts "Cleaning database..."
Post.destroy_all

puts "Creating posts..."
5.times do |i|
  post = Post.new(
  title: Faker::Lorem.sentence(word_count: 3),
  content: Faker::Lorem.paragraph_by_chars(number: 500),
  user_id: User.all.sample.id
  )
  post.save!
  puts "Created #{post.title}"
end

puts "Finished!"
