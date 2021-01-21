class Chef
  attr_accessor :name, :restaurant

  def initialize(name, years, restaurant) # need to pass an instance of restaurant in .new
    @name = name
    @years = years
    @restaurant = restaurant # instance of a restaurant
  end
end