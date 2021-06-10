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


   # method return json to slots hours avaible

  def self.slots_hours_avaible(id,date)
   
    slots = AppointmentApp.where(branchoffices: id, date: date , state: "Timetable")
    hours = {"available_slots": [
      {
        start_time: build_date(date,9), 
        end_time: build_date(date,10)
      },
      {
        start_time: build_date(date,10),
        end_time: build_date(date,11)
      },
      {
        start_time: build_date(date,11),
        end_time: build_date(date,12)
      },
      {
        start_time: build_date(date,12),
        end_time: build_date(date,13)
      },
      {
        start_time: build_date(date,13),
        end_time: build_date(date,14)
      },
      {
        start_time: build_date(date,14),
        end_time: build_date(date,15)
      },
      {
        start_time: build_date(date,15),
        end_time: build_date(date,16)
      },
      {
        start_time: build_date(date,16),
        end_time: build_date(date,17)
      },
      {
        start_time: build_date(date,17),
        end_time: build_date(date,18)
      }
    ]}
    ##recorremos el slots q son los appointment
    if !slots.empty?

      
      a = slots.map do |app|
        
        ##almacenamos en "b" la construnccion de la fecha y hora del appointment
        build =build_time(app.date, app.time)
        byebug
        ##sacamos las horas que no estan disponibles y nos quedan las disponibles 
        hours[:available_slots].reject!{|hour| build >= hour[:start_time] && build <=hour[:end_time]}
            
      end
     
    else
      hours[:available_slots]
    end

  end

  def self.build_date(date,hour)
    f = date.split("-")
    y = f[0].to_i
    mo = f[1].to_i
    d = f[2].to_i
    time_format = Time.new(y,mo,d,hour)
  end
end
