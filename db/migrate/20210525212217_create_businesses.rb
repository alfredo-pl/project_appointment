class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :email
      t.string :rut

      t.timestamps
    end
  end
end
