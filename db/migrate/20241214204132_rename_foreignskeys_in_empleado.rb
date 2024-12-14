class RenameForeignskeysInEmpleado < ActiveRecord::Migration[7.0]
  def change
    rename_column :empleados, :roles_id, :rol_id
    rename_column :empleados, :alcaldias_id, :alcaldia_id
    rename_column :empleados, :personas_id, :persona_id
  end
end
