require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # Ask the user for a recipe name (=> view)
    name = @view.ask_for("name")
    # Ask the user for a recipe description (=> view)
    description = @view.ask_for("description")
    # Create an instance of Recipe
    recipe = Recipe.new(name, description)
    # Add the recipe to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # Display all the recipes from the cookbook
    display_recipes
    # Ask the user which recipe index they want to delete (=> view)
    index = @view.ask_for_index
    # Ask the cookbook to delete the recipe at the index
    @cookbook.remove_recipe(index)
  end

  private

  def display_recipes
    # Get the recipes from the cookbook
    recipes = @cookbook.all
    # Ask the view to display those recipes
    @view.display_recipes(recipes)
  end
end