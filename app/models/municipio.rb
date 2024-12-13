class Municipio < ApplicationRecord
  belongs_to :alcade, class_name: "Persona", foreign_key: "persona_id"
  has_many :viviendas
end
