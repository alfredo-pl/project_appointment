class Business < ApplicationRecord
    has_many :branchoffices , dependent: :destroy
end
