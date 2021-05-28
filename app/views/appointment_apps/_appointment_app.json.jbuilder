json.extract! appointment_app, :id, :user_id, :branchoffice_id, :date, :time, :duration, :code, :state, :created_at, :updated_at
json.url appointment_app_url(appointment_app, format: :json)
