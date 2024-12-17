class Municipio < ApplicationRecord
  has_many :alcaldias
  has_many :viviendas

  validates :nombre, format: { with: /\A[a-zA-Z\s]+\z/, message: "El nombre debe ser una cadena de caracteres" }
  validates :area, numericality: { greater_than: 0, message: "El área debe ser mayor a 0" }
  validates :presupuesto, numericality: { greater_than: 0, message: "El presupuesto debe ser mayor a 0" }

end
