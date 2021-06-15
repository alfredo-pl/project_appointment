AppointmentApp.destroy_all
puts "Creating Appointment"
AppointmentApp.create!(user_id: 4 , branchoffice_id: 1, date:"2021-06-30" , time:"10:30", duration:"01:00", code: "65112223" , state:"timetable")
AppointmentApp.create!(user_id: 3 , branchoffice_id: 4, date:"2021-06-30" , time:"10:30", duration:"01:00", code: "86112223" , state:"timetable")
AppointmentApp.create!(user_id: 3 , branchoffice_id: 6, date:"2021-06-30" , time:"11:30", duration:"01:00", code: "55586223" , state:"timetable")

puts "Ending Appointment"