class Municipio < ApplicationRecord
  has_many :alcaldias
  has_many :viviendas
end
