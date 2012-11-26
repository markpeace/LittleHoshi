class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :token
      t.integer :uses, :default=>1
      t.string :notes

      t.timestamps
    end
  end
end
