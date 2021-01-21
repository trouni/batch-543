require_relative 'chef'

class Restaurant
  attr_reader :name, :location, :category, :reservations
  attr_accessor :capacity

  # self. makes this method a class method
  def self.categories
    %w(japanese french burgers ramen italian)
  end

  def self.price_for(category = "japanese")
    case category
    when 'japanese' then 100
    when 'french' then 200
    end
  end

  def initialize(name, location, category, capacity, chef_name, chef_years)
    @name = name
    @location = location
    @category = category
    @capacity = capacity
    @reservations = []
    @chef = Chef.new(chef_name, chef_years, self)
  end

  def make_reservation(customer_name)
    reservations << customer_name
  end

  def open?
    Time.now.hour >= 17 && Time.now.hour < 20
  end

  def closed?
    !open?
  end

  def print_reservations
    puts "These are the reservations:"
    reservations.each_with_index do |client_name, idx|
      puts "#{idx + 1}. #{client_name}"
    end
  end
end