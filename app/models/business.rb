class Business < ApplicationRecord
    has_many :branchoffices , dependent: :destroy
    belongs_to :user
end
