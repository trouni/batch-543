class Car # UpperCamelCase
  attr_reader :year, :engine_started
  # attr_writer :color
  attr_accessor :color # creates both attr_reader and attr_writer

  def initialize(color, year = 2021) # constructor
    # instance variables
    @engine_started = false # Boolean
    @color = color # String
    @year = year
  end

  # instance methods
  # attr_reader :color, :year, :engine_started
  # def color
  #   @color
  # end

  # def engine_started?
  #   @engine_started
  # end

  # attr_writer :color
  # def color=(new_color)
  #   @color = new_color
  # end

  def start!
    inject_fuel
    spark_ignition
    pump_pistons

    @engine_started = true
  end

  private

  def inject_fuel
    puts "Injecting fuel..."  
  end

  def spark_ignition
    puts "Sparking ignition..."  
  end

  def pump_pistons
    puts "Pumping pistons..."  
  end
end

kens_car = Car.new("red")

puts "What is the color of the car?"
puts kens_car.color

puts "Let's paint the car green."
kens_car.color = 'green'

puts "What is the color of the car?"
puts kens_car.color

puts "Is the engine started?"
puts kens_car.engine_started ? "Yes" : "No"

puts "Starting the car..."
kens_car.start!

puts "Is the engine started?"
puts kens_car.engine_started ? "Yes" : "No"
