class CreateDonors < ActiveRecord::Migration[7.0]
  def change
    create_table :donors, id: :uuid do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps
    end
  end
end
