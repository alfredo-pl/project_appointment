class Business < ApplicationRecord
    has_many :branchoffices , dependent: :destroy
    belongs_to :user


    #method to get count appoinment for business
    def self.get_count_appointment(id)
        branch = Branchoffice.references(:business).where(business_id: id)
        appointments = branch.map{|b| AppointmentApp.references(:branchoffice).where(branchoffice_id: b.id).count }
        appointments.sum
    end
end
