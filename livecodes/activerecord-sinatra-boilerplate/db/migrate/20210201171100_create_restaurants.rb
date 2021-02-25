class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |ruben|
      ruben.string :name
      ruben.string :city
      ruben.timestamps
    end
  end
end