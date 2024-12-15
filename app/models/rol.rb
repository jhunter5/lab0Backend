class Rol < ApplicationRecord
  self.table_name = 'roles'
  has_many :empleados

  validates :nombre, format: { with: /\A[a-zA-Z]+\z/, message: "solo permite letras" }
  validates :descripcion, format: { with: /\A[a-zA-Z\s]+\z/, message: "solo permite letras y espacios" }
  validates :activo, inclusion: { in: [true, false] }
end
