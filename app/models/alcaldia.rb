class Alcaldia < ApplicationRecord
  self.table_name = 'alcaldias'
  belongs_to :municipio
  has_many :empleados

  validates :direccion, length: { minimum: 5, maximum: 50, message: "La dirección debe tener entre 5 y 50 caracteres" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "El email no es válido" }
  validates :presupuesto_anual, numericality: { greater_than: 0 , message: "El presupuesto anual debe ser mayor a 0"}
  validates :fecha_fin, comparison: { greater_than: :fecha_inicio, message: "La fecha de fin debe ser mayor a la fecha de inicio" }
  validates :activo, inclusion: { in: [true, false], message: "El campo activo debe ser verdadero o falso" }

  validate :valid_foreign_key

  private

  def valid_foreign_key
    unless Municipio.exists?(municipio_id)
      errors.add(:municipio_id, "El municipio no existe")
    end
  end
end
