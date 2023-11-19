# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Apartment.destroy_all

puts "Creating apartments..."
wreck = {name: "Wreck", address: "7 Boundary St, London E2 7JE", price: 180, square_meters: 15, description: "A wreck of an apartment, but cheap!"}
tiffany =  {name: "Tiffany", address: "56A Shoreditch High St, London E1 6PQ", price: 350, square_meters: 50, description: "A Tiffany of an apartment - expensive, but worth it!"}

[wreck, tiffany].each do |attributes|
   apartment= Apartment.create!(attributes)
   puts "Created #{apartment.name}"
end

puts "Finished!"
