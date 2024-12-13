# Limpia la base de datos
Persona.destroy_all
Vivienda.destroy_all
Municipio.destroy_all


persona1 = Persona.create!(nombre: "Juan Hunter", edad: 21, telefono: "3188387926", sexo: "Hombre")


puts "Base de datos poblada con éxito!"
