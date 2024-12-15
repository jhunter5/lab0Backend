class Empleado < ApplicationRecord
  belongs_to :rol
  belongs_to :alcaldia
  belongs_to :persona

  # Validaciones de atributos
  validates :salario, numericality: { greater_than: 0, message: "El salario debe ser mayor a 0" }
  validates :tipo_contrato, inclusion: { in: %w[Temporal Fijo], message: "El tipo de contrato debe ser Temporal o Fijo" }
  validates :años_experiencia, numericality: { greater_than_or_equal_to: 0, message: "Los años de experiencia deben ser mayores o iguales a 0" }
  validates :activo, inclusion: { in: [true, false], message: "El campo activo debe ser verdadero o falso" }

  # Validaciones de claves foráneas
  validates :rol_id, presence: true, numericality: { only_integer: true, greater_than: 0, message: "El rol debe ser un número entero mayor a 0" }
  validates :alcaldia_id, presence: true, numericality: { only_integer: true, greater_than: 0, message: "La alcaldía debe ser un número entero mayor a 0" }
  validates :persona_id, presence: true, numericality: { only_integer: true, greater_than: 0, message: "La persona debe ser un número entero mayor a 0" }

  # Validación personalizada
  validate :valid_foreign_keys

  private

  # Método para validar las claves foráneas
  def valid_foreign_keys
    unless Rol.exists?(rol_id)
      errors.add(:rol_id, "El rol no existe")
    end
    unless Alcaldia.exists?(alcaldia_id)
      errors.add(:alcaldia_id, "La alcaldía no existe")
    end
    unless Persona.exists?(persona_id)
      errors.add(:persona_id, "La persona no existe")
    end
  end
end
