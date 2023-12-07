require 'faker'

puts "Cleaning database..."
User.destroy_all
Apartment.destroy_all
Post.destroy_all
Review.destroy_all

puts "Creating users..."

6.times do |i|
  letter = ('a'..'z').to_a[i]
  User.create!(
    username: Faker::Name.name,
    email: "#{letter}@haven.com",
    password: "111111"
  )
end

puts "Created #{User.count} users"

puts "Creating apartments..."

12.times do |i|
  apartment = Apartment.new(
  name: Faker::Coffee.blend_name,
  address: Faker::Address.street_address + ", " + Faker::Address.country,
  price: rand(1.0..50.0),
  square_meters: rand(10..150),
  description: Faker::Lorem.paragraph_by_chars,
  latitude: Faker::Address.latitude,
  longitude: Faker::Address.longitude,
  user_id: User.pluck(:id).sample
  )
  photo = File.open("app/assets/images/tent#{i + 1}.jpg")
  apartment.photo.attach(io: photo, filename: apartment.name, content_type: 'image/jpg')
  apartment.save!
  puts "Created #{apartment.name}"
end

puts "Created #{Apartment.count} apartments"

puts "Creating posts..."
5.times do |i|
  post = Post.new(
  title: Faker::Lorem.sentence(word_count: 3),
  content: Faker::Lorem.paragraph_by_chars(number: 500),
  user_id: User.pluck(:id).sample
  )
  post.save!
  puts "Created #{post.title}"
end

puts "Created #{Post.count} posts"

puts "Creating reviews..."

Apartment.all.each do |apartment|
  rand(4..10).times do |i|
    review = Review.new(
    content: Faker::ChuckNorris.fact,
    apartment_id: apartment.id
    )
    review.save!
  end
end

puts "Created #{Review.count} reviews"

puts "Finished!"
