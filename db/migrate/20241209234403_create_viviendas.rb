class CreateViviendas < ActiveRecord::Migration[7.0]
  def change
    create_table :viviendas do |t|
      t.string :direccion
      t.integer :capacidad
      t.integer :niveles
      t.references :municipio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
