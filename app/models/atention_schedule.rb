class AtentionSchedule < ApplicationRecord
  belongs_to :branchoffice , dependent: :destroy


  def self.days_atentions(days)
   
    st = days.map{|d| e =d[0].split}
  
  end
end
