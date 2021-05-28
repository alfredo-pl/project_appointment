class CreateAppointmentApps < ActiveRecord::Migration[6.1]
  def change
    create_table :appointment_apps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :branchoffice, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.time :duration
      t.string :code
      t.string :state

      t.timestamps
    end
  end
end
