require_relative 'restaurant'

class FastFood < Restaurant
  attr_reader :prep_time

  def initialize(name, location, category, capacity, prep_time)
    super(name, location, category, capacity)
    @prep_time = prep_time
  end

  def print_reservations
    puts "=========================="
    super
    puts "=========================="
  end
end