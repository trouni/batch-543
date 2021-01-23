class View
  def display_recipes(recipes)
    puts "-" * 20
    puts "Here are your recipes:"
    recipes.each_with_index do |recipe, idx|
      puts "#{idx + 1}. #{recipe.name} - #{recipe.description}"
    end
    puts "-" * 20
  end

  def ask_for_index
    puts "Please choose a number:"
    print "> "
    gets.chomp.to_i - 1
  end

  def ask_for(thing)
    puts "Please enter the #{thing} for your recipe:"
    print "> "
    gets.chomp
  end
end