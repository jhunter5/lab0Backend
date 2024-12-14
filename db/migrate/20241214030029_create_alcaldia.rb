class CreateAlcaldia < ActiveRecord::Migration[7.0]
  def change
    create_table :alcaldias do |t|
      t.string :direccion
      t.string :email
      t.float :presupuesto_anual
      t.datetime :fecha_inicio
      t.datetime :fecha_fin
      t.boolean :activo
      t.references :municipio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
