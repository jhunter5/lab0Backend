class Vivienda < ApplicationRecord
  belongs_to :municipio
  has_many :personas
  has_many :propietarios
  has_many :personas_propietarias, through: :propietarios, source: :persona

  validates :capacidad, numericality: { only_integer: true, greater_than: 0 }
  validates :niveles, numericality: { only_integer: true, greater_than: 0 }
end
