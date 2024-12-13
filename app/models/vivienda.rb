class Vivienda < ApplicationRecord
  belongs_to :municipio
  has_many :personas
  has_many :propietarios
  has_many :personas_propietarias, through: :propietarios, source: :persona
end
