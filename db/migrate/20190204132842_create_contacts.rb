class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :organization, foreign_key: true
      t.references :contact_type, foreign_key: true
      t.text :data, null: false

      t.timestamps
    end
  end
end
