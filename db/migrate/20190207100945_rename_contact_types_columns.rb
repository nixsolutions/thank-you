class RenameContactTypesColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :contact_types, :title, :main_type
  end
end
