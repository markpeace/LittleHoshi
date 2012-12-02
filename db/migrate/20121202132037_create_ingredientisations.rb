class CreateIngredientisations < ActiveRecord::Migration
  def change
    create_table :ingredientisations do |t|
      t.integer :activity_id
      t.integer :ingredient_id
      t.integer :quantity

      t.timestamps
    end
  end
end
