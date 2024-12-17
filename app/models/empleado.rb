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
  validate :single_alcalde_per_alcaldia
  validate :años_experiencia_no_mayor_que_edad_persona
  validate :salario_no_mayor_que_presupuesto_alcaldia

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

  # Validación personalizada para garantizar que solo haya un alcalde por alcaldía
  def single_alcalde_per_alcaldia
    if rol_id == Rol.find_by(nombre: 'Alcalde')&.id
      existing_alcaldes_count = Empleado.where(alcaldia_id: alcaldia_id, rol_id: Rol.find_by(nombre: 'Alcalde')&.id).count
      if existing_alcaldes_count > 0
        errors.add(:alcaldia_id, "Ya existe un empleado con el rol de Alcalde en esta alcaldía")
      end
    end
  end

  def años_experiencia_no_mayor_que_edad_persona
    if persona.present? && años_experiencia.present? && persona.edad.present?
      if años_experiencia > persona.edad
        errors.add(:años_experiencia, "No pueden ser superiores a la edad de la persona asociada")
      end
    end
  end

  def salario_no_mayor_que_presupuesto_alcaldia
    if alcaldia.present? && salario.present?
      if salario > alcaldia.presupuesto_anual
        errors.add(:salario, "no puede ser mayor al presupuesto anual de la alcaldía")
      end
    end
  end

end
