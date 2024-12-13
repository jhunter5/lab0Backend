class ChangeViviendaIdInPersonas < ActiveRecord::Migration[7.0]
  def change
    change_column_null :personas, :vivienda_id, true
  end
end
