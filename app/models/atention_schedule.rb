class AtentionSchedule < ApplicationRecord
  belongs_to :branchoffice , dependent: :destroy
end
