class CreateAtentionSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :atention_schedules do |t|
      t.references :branchoffice, null: false, foreign_key: true
      t.string :day
      t.time :hour_init
      t.time :hour_end

      t.timestamps
    end
  end
end
