Branchoffice.destroy_all
puts "Creating Branchoffice"
Branchoffice.create!(business_id: 1 ,code_branchoffice: "OD001", city: "Santiago", address:"Santigo 3333")
Branchoffice.create!(business_id: 1 ,code_branchoffice: "OD002", city: "Santiago", address:"Independencia 3333")
Branchoffice.create!(business_id: 1 ,code_branchoffice: "OD003", city: "Santiago", address:"Las Condes 3333")

Branchoffice.create!(business_id: 2 , code_branchoffice: "HS001", city: "Concepción", address:"Concepción 4444")

Branchoffice.create!(business_id: 3 ,code_branchoffice: "HTW001", city: "Santiago", address:"Santigo 1111")
Branchoffice.create!(business_id: 3 ,code_branchoffice: "HTW002", city: "Santiago", address:"Santigo 2222")

puts "Ending Branchoffice"