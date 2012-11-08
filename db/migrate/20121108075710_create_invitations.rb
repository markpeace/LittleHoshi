class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :token
      t.integer :count
      t.string :notes

      t.timestamps
    end
  end
end
