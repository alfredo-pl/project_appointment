class AddDayToAtentionSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :atention_schedules, :day, :json
  end
end
