class Rol < ApplicationRecord
  self.table_name = 'roles'
  has_many :empleados

end
