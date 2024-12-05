# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'

# Clear existing data
Book.destroy_all
Author.destroy_all
Genre.destroy_all

# Create 20 genres
puts "Creating genres..."
genres = 20.times.map do
  Genre.create!(name: Faker::Book.genre)
end

# Create 50 authors
puts "Creating authors..."
authors = 50.times.map do
  Author.create!(name: Faker::Book.author)
end

# Create 500 books
puts "Creating books..."
500.times do
  Book.create!(
    title: Faker::Book.title,
    author: authors.sample,
    genre: genres.sample
  )
end

puts "Seeding complete!"

