class Persona < ApplicationRecord
  belongs_to :vivienda, optional: true
  belongs_to :padre, class_name: 'Persona', foreign_key: 'padre_id', optional: true
  has_many :hijos, class_name: 'Persona', foreign_key: 'padre_id', dependent: :nullify
  has_many :propietarios
  has_many :viviendas_propietarias, through: :propietarios, source: :vivienda
  has_one :empleado

  validates :nombre, format: { with: /\A[a-zA-Z\s]+\z/, message: "El nombre solo puede contener letras y espacios" }
  validates :telefono, format: { with: /\A[0-9]{10}\z/, message: "El teléfono debe tener 10 dígitos" }
  validates :edad, numericality: { only_integer: true, greater_than: 0, less_than: 120, message: "La edad debe ser un número entero mayor a 0 y menor a 120" }
  validates :sexo, inclusion: { in: %w[Hombre Mujer], message: "El sexo debe ser Hombre o Mujer" }

  validate :vivienda_existente
  validate :vivienda_capacidad

  private

  def vivienda_existente
    if vivienda_id && !Vivienda.exists?(vivienda_id)
      errors.add(:vivienda_id, "La vivienda no existe")
    end
  end

  def vivienda_capacidad
    vivienda_a_asignar = Vivienda.find_by(id: vivienda_id)

    if vivienda_a_asignar && vivienda_a_asignar.personas.count + 1 > vivienda_a_asignar.capacidad
      errors.add(:vivienda, "No se puede asignar a la persona porque la vivienda alcanzo su capacidad maxima")
    end
  end
end
