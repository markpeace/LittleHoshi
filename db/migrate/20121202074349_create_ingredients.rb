class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :unitcost
      t.integer :stock

      t.timestamps
    end
  end
end
