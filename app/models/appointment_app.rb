class AppointmentApp < ApplicationRecord
  belongs_to :user
  belongs_to :branchoffice



  def business_appointment
    business = Business.references(:branchoffices).where(id: branchoffice_id).pluck :name
    business.first
  end
  def direction_appointment
    direction = Branchoffice.references(:appointment_apps).where(id: branchoffice_id).pluck :address
    direction.first
  end
    
  def cancel_appointment
    self.state = "Cancelled"
    self.save
  end

  def self.generator_code
    alt =Random.new
    num = %w{ 1 2 3 4 5 6 7 8 9 0 }
    code = []
    5.times do 
      
      code << alt.rand(num.length)
    end
    code.join().to_i
  end


  # method return json to calendar

  def self.events_calendar(branchoffice_id)
    
    appointments = AppointmentApp.where(branchoffice_id: branchoffice_id, state: "Timetable")
    app = appointments.map{|event| info ={
      "id" => event.id,
      "start" => build_time(event.date, event.time),
      "title" => event.time.strftime("at %I:%M%p") +" "+ event.user_id.to_s
    }} 
    
  end

  # build datetime

  def self.build_time(date, time)
   y = date.strftime("%Y").to_i
   mo = date.strftime("%_m").to_i
   d = date.strftime("%e").to_i
   h = time.strftime("%H").to_i
   m = time.strftime("%M").to_i
    time_format = Time.new(y,mo,d,h,m)
  end
end
