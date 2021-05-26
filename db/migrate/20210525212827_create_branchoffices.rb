class CreateBranchoffices < ActiveRecord::Migration[6.1]
  def change
    create_table :branchoffices do |t|
      t.references :business, null: false, foreign_key: true
      t.string :code_branchoffice
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
