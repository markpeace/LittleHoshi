class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :theme
      t.text :notes

      t.timestamps
    end
  end
end
