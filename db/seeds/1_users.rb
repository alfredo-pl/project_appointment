User.destroy_all
puts "Creating Users"
User.create!(email: "alejandro@example.cl", name: "Alejandro Pietro", password: "123123", password_confirmation:"123123")
User.create!(email:"marcela@example.cl", name: "Marcela Valenzuela", password: "123123", password_confirmation:"123123")
User.create!(email:"alba@example.cl", name: "Alba Mendez" , password: "123123", password_confirmation:"123123")

puts "Ending Users"