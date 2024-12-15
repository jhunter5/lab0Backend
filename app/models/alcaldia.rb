class Alcaldia < ApplicationRecord
  self.table_name = 'alcaldias'
  belongs_to :municipio
  has_many :empleados

  validates :direccion, presence: true, length: { minimum: 5, maximum: 50 } message: "La dirección debe tener entre 5 y 50 caracteres"
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } message: "El email no es válido"
  validates :presupuesto_anual, presence: true, numericality: { greater_than: 0 } message: "El presupuesto anual debe ser mayor a 0"
  validates :fecha_inicio, presence: true
  validates :fecha_fin, presence: true, comparison: { greater_than: :fecha_inicio } message: "La fecha de fin debe ser mayor a la fecha de inicio"
  validates :activo, presence: true, inclusion: { in: [true, false] } message: "El campo activo debe ser verdadero o falso"
end
