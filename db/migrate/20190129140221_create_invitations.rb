class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string   :token
      t.timestamps
    end
    add_index :invitations, :token, unique: true
  end
end
