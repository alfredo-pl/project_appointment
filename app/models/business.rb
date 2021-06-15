class Business < ApplicationRecord
    has_many :branchoffices , dependent: :destroy
    belongs_to :user


    #method to get count appoinment for business
    def self.get_count_appointment(id)
        branch = Branchoffice.references(:business).where(business_id: id)
        appointments = branch.map{|b| AppointmentApp.references(:branchoffice).where(branchoffice_id: b.id).count }
        appointments.sum
    end

    def self.get_all_appointment(current_user)
        arr =[]
        ha = {}
        hash = Business.where(user_id: current_user)
        keys = hash.each{| key, value| arr <<{ name: key.name, value: Business.get_count_appointment(key)} }
        arr.each do |ele|
            ha[ele[:name]]= ele[:value]
        end
        ha
    end

    def self.get_branchoffice(current_user)
        
        arr =[]
        ha = {}
        hash = Business.where(user_id: current_user)
        keys = hash.each{|key| arr <<{ name: key.name, value: Business.get_appointment_branch(key)} }
        arr
    end

    def self.get_appointment_branch(id)
        arr =[]
        ha = {}
        branch = Branchoffice.references(:business).where(business_id: id)
        branch.each{|b|arr << { name: b.code_branchoffice , value: AppointmentApp.references(:branchoffice).where(branchoffice_id: b.id).count} }
        arr.each do |ele|
            ha[ele[:name]]= ele[:value]
        end
        ha
    end

end
