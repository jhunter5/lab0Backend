class CreateEmpleados < ActiveRecord::Migration[7.0]
  def change
    create_table :empleados do |t|
      t.float :salario
      t.string :tipo_contrato
      t.integer :años_experiencia
      t.datetime :fecha_ingreso
      t.boolean :activo

      t.references :roles, null: false, foreign_key: true
      t.references :alcaldias, null: false, foreign_key: true
      t.references :personas, null: false, foreign_key: true

      t.timestamps
    end
  end
end
