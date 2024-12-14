class Alcaldia < ApplicationRecord
  self.table_name = 'alcaldias'
  belongs_to :municipio
  has_many :empleados

end
