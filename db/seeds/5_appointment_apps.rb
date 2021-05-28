AppointmentApp.destroy_all
puts "Creating Appointment"
AppointmentApp.create!(user_id: 1 , branchoffice_id: 1, date:"2021-05-30" , time:"08:30", duration:"00:15", code: "AOSKNDSSD12223" , state:"timetable")
AppointmentApp.create!(user_id: 2 , branchoffice_id: 4, date:"2021-05-30" , time:"10:30", duration:"00:15", code: "OIRQSADFD12223" , state:"timetable")
AppointmentApp.create!(user_id: 3 , branchoffice_id: 6, date:"2021-05-30" , time:"11:30", duration:"00:15", code: "OAKSNDAND12223" , state:"timetable")

puts "Ending Appointment"