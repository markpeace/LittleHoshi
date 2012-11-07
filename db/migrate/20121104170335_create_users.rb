class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :hashed_password
	  t.boolean :is_admin

      t.timestamps
    end
  end
end
