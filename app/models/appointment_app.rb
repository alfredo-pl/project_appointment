class AppointmentApp < ApplicationRecord
  belongs_to :user
  belongs_to :branchoffice

  def self.generator_code
    alt =Random.new
    num = %w{ 1 2 3 4 5 6 7 8 9 0 }
    code = []
    5.times do 
      
      code << alt.rand(num.length)
    end
    code.join().to_i
  end
end
