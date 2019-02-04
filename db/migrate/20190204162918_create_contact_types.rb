class CreateContactTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_types do |t|
      t.string :title
      t.string :subtype

      t.timestamps
    end

    add_index :contact_types, [:title, :subtype], unique: true
  end
end
