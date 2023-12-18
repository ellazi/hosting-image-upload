require 'faker'
require 'date'

puts "Cleaning database..."
Post.destroy_all
Review.destroy_all
Article.destroy_all
Visit.destroy_all
Apartment.destroy_all
User.destroy_all

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
  title: Faker::Restaurant.type,
  content: Faker::Restaurant.review ,
  user_id: User.pluck(:id).sample
  )
  post.save!
  puts "Created #{post.title}"
end

puts "Created #{Post.count} posts"

puts "Creating reviews..."

Apartment.all.each do |apartment|
  rand(2..8).times do |i|
    review = Review.new(
    content: Faker::ChuckNorris.fact,
    apartment_id: apartment.id
    )
    review.save!
  end
end

puts "Created #{Review.count} reviews"

puts "Creating articles..."

art_1 = {title: "UN expert urges action to end global affordable housing crisis",
  link: "https://www.ohchr.org/en/press-releases/2023/10/un-expert-urges-action-end-global-affordable-housing-crisis",
  source: "United Nations",
  extract: "The world is grappling with a situation where more and more people are unable to afford their housing costs. Millions lack the financial means to access safe, secure and habitable housing,” said Balakrishnan Rajagopal, the UN Special Rapporteur on the right to adequate housing.",
  date: Date.strptime("20 October 2023", "%d %B %Y")
}

art_2 = {title: "Is the global housing slump over?",
  link: "https://www.economist.com/finance-and-economics/2023/06/12/is-the-global-housing-slump-over",
  source: "The Economist",
  extract: "In australia house prices have risen for the past three months. In America a widely watched index of housing values has risen by 1.6% from its low in January, and housebuilders’ share prices have done twice as well as the overall stockmarket. In the euro area the property market looks steady. “[M]ost of the drag from housing on gdp growth from now on should be marginal,” wrote analysts at jpmorgan Chase, a bank, in a recent report about America. “[W]e believe the peak negative drag from the recent housing-market slump to private consumption is likely behind us,” wrote wonks at Goldman Sachs, another bank, about South Korea.",
  date: Date.strptime("12 June 2023", "%d %B %Y")
}

[art_1, art_2].each do |attributes|
  article = Article.create!(attributes)
  puts "Created #{article.title}"
end


puts "Finished!"
