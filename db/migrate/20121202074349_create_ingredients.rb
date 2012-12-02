class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :unitcost, :precision=>4, :scale=>2
      t.integer :stock, :default=>0

      t.timestamps
    end
  end
end
