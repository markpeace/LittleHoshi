class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :box_id
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
