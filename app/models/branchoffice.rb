class Branchoffice < ApplicationRecord
  belongs_to :business
  has_many :appointment_apps, dependent: :destroy
  has_one :atention_schedule, dependent: :destroy
end
