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
    slots = AppointmentApp.where(branchoffices: id, date: date , state: "timetable")
    available_slots = [
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
    ]
    ##recorremos el slots q son los appointment
    if !slots.empty?
      # Obtenemos solo los DateTimes para cada Appointment
      datetimes = slots.map { |slot| build_time(slot.date, slot.time) }

      # Por cada available_slot, revisamos si hay un appointment entre dicho horario
      # y borramos el available_slot en caso que si haya un appointment entremedio
      available_slots.each_with_index do |available_slot, index|
        datetimes.each do |datetime| if datetime.between?(available_slot[:start_time], available_slot[:end_time]) available_slots.delete_at(index)
          end
        end
      end
    end
    { "available_slots": available_slots }
  end

  def self.build_date(date,hour)
    f = date.split("-")
    y = f[0].to_i
    mo = f[1].to_i
    d = f[2].to_i
    time_format = Time.new(y,mo,d,hour)
  end

  def self.create_appointment(branch_id, star_time, end_time, user)
    AppointmentApp.create(
      user_id: user.id,
      branchoffice_id: branch_id,
      date: ,
      time: ,
      duration: ,
      code: self.generator_code,
      state: 'timetable'
    )

  end

end
