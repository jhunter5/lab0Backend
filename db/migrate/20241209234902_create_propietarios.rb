class CreatePropietarios < ActiveRecord::Migration[7.0]
  def change
    create_table :propietarios do |t|
      t.references :persona, null: false, foreign_key: true
      t.references :vivienda, null: false, foreign_key: true

      t.timestamps
    end
  end
end
