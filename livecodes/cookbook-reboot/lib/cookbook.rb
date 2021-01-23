require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = [] # this is an array of Recipe INSTANCES!!!!
    load_csv
  end

  # CRUD - instance methods

  def all
    @recipes
  end

  def add_recipe(recipe) # recipe is an INSTANCE of Recipe
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    # TODO: fill the @recipes array with instances of Recipe from the CSV
    CSV.foreach(@csv_file) do |row| # row is an array of strings
      @recipes << Recipe.new(row[0], row[1])  # We instantiate a Recipe from strings
    end
  end

  def save_csv
    # TODO: store the elements of @recipes into a CSV file
    CSV.open(@csv_file, 'wb', force_quotes: true) do |csv|
      # @recipes is an array of instances
      @recipes.each do |recipe| # recipe is an instance of Recipe
        # CSV can not store instances, only strings
        csv << [recipe.name, recipe.description] # one row in the CSV
      end
    end
  end
end