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
  validate :alcaldia_already_exists, on: :create
  validate :presupuesto_anual_no_excede_presupuesto_municipio
  validate :duracion_maxima_cuatro_años

  private

  def valid_foreign_key
    unless Municipio.exists?(municipio_id)
      errors.add(:municipio_id, "El municipio no existe")
    end
  end

  def alcaldia_already_exists
    if Alcaldia.exists?(municipio_id: municipio_id)
      errors.add(:municipio_id, "Ya existe una alcaldía para este municipio")
    end
  end

  def presupuesto_anual_no_excede_presupuesto_municipio
    if municipio.present? && presupuesto_anual > municipio.presupuesto
      errors.add(:presupuesto_anual, "no puede ser mayor al presupuesto del municipio")
    end
  end

  def duracion_maxima_cuatro_años
    if fecha_inicio.present? && fecha_fin.present?
      max_fecha_fin = fecha_inicio.advance(years: 4)
      if fecha_fin > max_fecha_fin
        errors.add(:fecha_fin, "La duración entre fecha de inicio y fecha de fin no puede superar los 4 años")
      end
    end
  end

end
