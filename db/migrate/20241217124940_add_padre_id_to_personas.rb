class AddPadreIdToPersonas < ActiveRecord::Migration[7.0]
  def change
    add_column :personas, :padre_id, :integer
    add_foreign_key :personas, :personas, column: :padre_id
    add_index :personas, :padre_id
  end
end
