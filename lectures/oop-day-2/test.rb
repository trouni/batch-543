require_relative 'restaurant'
require_relative 'fast_food'
require_relative 'gastronomic_restaurant'

ichiran = Restaurant.new("Ichiran", "Fukuoka", "ramen", 32, "Anthony Nicholson", 15)
p ichiran

# p ichiran

# puts "The restaurant is named: #{ichiran.name}."

# puts "The current capacity of the restaurant is #{ichiran.capacity} seats."

# puts "The restaurant is undergoing some renovations..."
# ichiran.capacity = 50

# puts "The new capacity of the restaurant is #{ichiran.capacity} seats."


# puts "Charlotte, Ken and Natasha are making reservations to Ichiran."
# ichiran.make_reservation("Charlotte")
# ichiran.make_reservation("Ken")
# ichiran.make_reservation("Natasha")

# ichiran.print_reservations
# # puts "Current reservations: #{ichiran.reservations.join(', ')}."

# # puts "The restaurant is currenty #{ichiran.open? ? 'open' : 'closed'}."

# burger_king = FastFood.new("Burger King", "Kawasaki", "burger", 45, 5)
# tour_dargent = GastronomicRestaurant.new("La Tour d'Argent", "Tokyo", "french", 60, 3)
# p burger_king, tour_dargent

# burger_king.make_reservation("Charlotte")
# burger_king.make_reservation("Scooter")
# burger_king.make_reservation("Brandon")

# burger_king.print_reservations