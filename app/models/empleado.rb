class Empleado < ApplicationRecord
  belongs_to :roles
  belongs_to :alcaldias
  belongs_to :personas
end
