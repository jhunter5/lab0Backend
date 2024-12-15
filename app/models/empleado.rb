class Empleado < ApplicationRecord
  belongs_to :rol
  belongs_to :alcaldia
  belongs_to :persona
end
