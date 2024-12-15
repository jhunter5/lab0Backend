class CreatePersonas < ActiveRecord::Migration[7.0]
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :telefono
      t.integer :edad
      t.string :sexo
      t.references :vivienda, null: true, foreign_key: true

      t.timestamps
    end
  end
end
