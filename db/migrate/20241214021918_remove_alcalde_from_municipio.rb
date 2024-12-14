class RemoveAlcaldeFromMunicipio < ActiveRecord::Migration[7.0]
  def change
    remove_column :municipios, :persona_id, :integer
  end
end
