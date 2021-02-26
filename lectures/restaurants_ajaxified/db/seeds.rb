puts 'Creating restaurants and reviews...'
10.times do
  restaurant = Restaurant.create!({
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    description: Faker::Restaurant.description,
    category: Faker::Restaurant.type
  })
  print '>'
  
  rand(10).times do
    Review.create!({
      content: Faker::Restaurant.review,
      restaurant: restaurant
    })
    print '>'
  end
end
puts
puts 'Finished!'