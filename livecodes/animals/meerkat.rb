require_relative 'animal'

class Meerkat < Animal
  def talk
    "#{@name} barks"
  end
end