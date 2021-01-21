require_relative 'restaurant'

class GastronomicRestaurant < Restaurant
  attr_reader :stars

  def initialize(name, location, category, capacity, stars)
    @name = name
    @location = location
    @category = category
    @capacity = capacity
    @reservations = []
    @stars = stars
  end

  def print_reservations
    puts "You are not allowed to print the reservations for #{name}."
  end
end
