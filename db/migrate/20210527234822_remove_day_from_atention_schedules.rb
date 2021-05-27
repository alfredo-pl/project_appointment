class RemoveDayFromAtentionSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :atention_schedules, :day, :string
    remove_column :atention_schedules, :hour_init, :time
    remove_column :atention_schedules, :hour_end, :time
  end
end
