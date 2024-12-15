# Limpia la base de datos
Empleado.destroy_all
Propietario.destroy_all
Persona.destroy_all
Alcaldia.destroy_all
Vivienda.destroy_all
Rol.destroy_all
Municipio.destroy_all

# Creacion de personas
persona1 = Persona.create!(nombre: "Juan Hunter", edad: 21, telefono: "3188387926", sexo: "Hombre")
persona2 = Persona.create!(nombre: "Gabriela Guzman", edad: 20, telefono: "3214582918", sexo: "Mujer")
persona3 = Persona.create!(nombre: "Eder Cartagenero", edad: 21, telefono: "3188387926", sexo: "Hombre")
persona4 = Persona.create!(nombre: "Luisa Perez", edad: 20, telefono: "3214582918", sexo: "Mujer")
persona5 = Persona.create!(nombre: "Carlos Murcia", edad: 21, telefono: "3188387926", sexo: "Hombre")
persona6 = Persona.create!(nombre: "Nicolas Maduro", edad: 62, telefono: "32054627845", sexo: "Hombre")

# Creacion de Municipios
bogota = Municipio.create!(nombre: "Bogotá", area: 1000, presupuesto: 5000000000)
villavicencio = Municipio.create!(nombre: "Villavicencio", area: 900, presupuesto: 2000000000)
cali = Municipio.create!(nombre: "Cali", area: 800, presupuesto: 3000000000)
maracaibo = Municipio.create!(nombre: "Maracaibo", area: 700, presupuesto: 10)
villa_de_leyva = Municipio.create!(nombre: "Villa de Leyva", area: 600, presupuesto: 1000000000)

#Creacion de viviendas
vivienda1 = Vivienda.create!(direccion: "Calle 1 # 2-3", capacidad: 4, niveles: 3, municipio_id: bogota.id)
vivienda2 = Vivienda.create!(direccion: "Calle 2 # 3-4", capacidad: 2, niveles: 1, municipio_id: villavicencio.id)
vivienda3 = Vivienda.create!(direccion: "Calle 3 # 4-5", capacidad: 3, niveles: 2, municipio_id: cali.id)
vivienda4 = Vivienda.create!(direccion: "Calle 4 # 5-6", capacidad: 1, niveles: 1, municipio_id: maracaibo.id)
vivienda5 = Vivienda.create!(direccion: "Calle 5 # 6-7", capacidad: 5, niveles: 4, municipio_id: villa_de_leyva.id)
vivienda6 = Vivienda.create!(direccion: "Calle 6 # 7-8", capacidad: 6, niveles: 5, municipio_id: bogota.id)
vivienda7 = Vivienda.create!(direccion: "Calle 7 # 8-9", capacidad: 4, niveles: 3, municipio_id: villavicencio.id)
vivienda8 = Vivienda.create!(direccion: "Calle 8 # 9-10", capacidad: 2, niveles: 2, municipio_id: bogota.id)

# Asignacion de viviendas a personas como residentes
persona1.update!(vivienda_id: vivienda1.id)
persona2.update!(vivienda_id: vivienda1.id)
persona3.update!(vivienda_id: vivienda4.id)
persona4.update!(vivienda_id: vivienda2.id)
persona5.update!(vivienda_id: vivienda8.id)


#Asignacion de viviendas a personas como propietarios
Propietario.create!(persona_id: persona2.id, vivienda_id: vivienda1.id)
Propietario.create!(persona_id: persona1.id, vivienda_id: vivienda1.id)
Propietario.create!(persona_id: persona2.id, vivienda_id: vivienda6.id)
Propietario.create!(persona_id: persona2.id, vivienda_id: vivienda7.id)
Propietario.create!(persona_id: persona6.id, vivienda_id: vivienda4.id)
Propietario.create!(persona_id: persona1.id, vivienda_id: vivienda2.id)
Propietario.create!(persona_id: persona4.id, vivienda_id: vivienda3.id)
Propietario.create!(persona_id: persona5.id, vivienda_id: vivienda5.id)

#Crear alcaldias para los municipios
alcaldiaBogota = Alcaldia.create!(municipio_id: bogota.id, direccion: "Calle 10 # 11-12", email: "bogotaAlcaldia.gov.co", presupuesto_anual: 10000000, activo: true)
alcaldiaVillavicencio = Alcaldia.create!(municipio_id: villavicencio.id, direccion: "Calle 11 # 12-13",  email: "villavicencioAlcaldia.gov.co", presupuesto_anual: 8000000, activo: true)
alcaldiaCali =Alcaldia.create!(municipio_id: cali.id, direccion: "Calle 12 # 13-14",  email: "caliAlcaldia.gov.co", presupuesto_anual: 9000000, activo: true)
alcaldiaMaracaibo =Alcaldia.create!(municipio_id: maracaibo.id, direccion: "Calle 13 # 14-15",  email: "maracaiboAlcaldia.gov.co", presupuesto_anual: 10, activo: true)
alcaldiaVillaLeyva = Alcaldia.create!(municipio_id: villa_de_leyva.id, direccion: "Calle 14 # 15-16",  email: "villaLeyvaAlcaldia.gov.co", presupuesto_anual: 3000000, activo: true)

#Crear roles
Rol.create!(nombre: "Alcalde", descripcion: "Encargado de la administración del municipio", activo: true)
Rol.create!(nombre: "Secretario", descripcion: "Encargado de la secretaria del municipio", activo: true)
Rol.create!(nombre: "Tesorero", descripcion: "Encargado de la tesoreria del municipio", activo: true)
Rol.create!(nombre: "Concejal", descripcion: "Encargado de la concejalía del municipio", activo: true)

#Crear empleados
Empleado.create!(persona_id: persona2.id, alcaldia_id: alcaldiaBogota.id, rol_id: Rol.find_by(nombre: "Alcalde").id, activo: true, salario: 1000000, tipo_contrato: "Fijo", años_experiencia: 2, fecha_ingreso: "2020-01-01")
Empleado.create!(persona_id: persona1.id, alcaldia_id: alcaldiaVillavicencio.id, rol_id: Rol.find_by(nombre: "Alcalde").id, activo: true, salario: 1000000, tipo_contrato: "Fijo", años_experiencia: 2, fecha_ingreso: "2020-01-01")
Empleado.create!(persona_id: persona4.id, alcaldia_id: alcaldiaCali.id, rol_id: Rol.find_by(nombre: "Alcalde").id, activo: true, salario: 1000000, tipo_contrato: "Fijo", años_experiencia: 2, fecha_ingreso: "2020-01-01")
Empleado.create!(persona_id: persona6.id, alcaldia_id: alcaldiaMaracaibo.id, rol_id: Rol.find_by(nombre: "Alcalde").id, activo: true, salario: 10000000000, tipo_contrato: "Fijo", años_experiencia: 2, fecha_ingreso: "2020-01-01")
Empleado.create!(persona_id: persona5.id, alcaldia_id: alcaldiaVillaLeyva.id, rol_id: Rol.find_by(nombre: "Alcalde").id, activo: true, salario: 1000000, tipo_contrato: "Fijo", años_experiencia: 2, fecha_ingreso: "2020-01-01")
Empleado.create!(persona_id: persona3.id, alcaldia_id: alcaldiaMaracaibo.id, rol_id: Rol.find_by(nombre: "Secretario").id, activo: true, salario: 1000000, tipo_contrato: "Fijo", años_experiencia: 2, fecha_ingreso: "2020-01-01")


puts "Base de datos poblada con éxito!"
