class Propietario < ApplicationRecord
  belongs_to :persona
  belongs_to :vivienda
end
