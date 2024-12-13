class Persona < ApplicationRecord
  belongs_to :vivienda, optional: true
  has_many :propietarios
  has_many :viviendas_propietarias, through: :propietarios, source: :vivienda
end
