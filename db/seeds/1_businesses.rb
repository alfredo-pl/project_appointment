Business.destroy_all
puts "Creating business"
Business.create!(name: "Odontologia Prima", email: "odongolia_prima@business.cl", rut: "77.666.666-2")
Business.create!(name: "Salon de belleza hight style", email: "hightstyle@business.cl", rut: "75.666.666-k")
Business.create!(name: "Optica HTW", email: "opticahtw@business.cl", rut: "79.666.666-1")
puts "Ending business"