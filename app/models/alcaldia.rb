class Alcaldia < ApplicationRecord
  self.table_name = 'alcaldias'
  belongs_to :municipio
end
