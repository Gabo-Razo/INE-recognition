require_relative 'ine_recognition'

ine = GR_RECOGNITION::Ine.new("ine5.jpeg")

puts "--- RESULTADOS COMPLETOS GR ---"
puts "Nombre:     #{ine.name}"
puts "Domicilio:  #{ine.address}"
puts "Sección:    #{ine.section}"
puts "Vigencia:   #{ine.validity}"
puts "Clave:      #{ine.elector_key}"
puts "CURP:       #{ine.curp}"