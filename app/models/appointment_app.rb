class AppointmentApp < ApplicationRecord
  belongs_to :user
  belongs_to :branchoffice
end
