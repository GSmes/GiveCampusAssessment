class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations, id: :uuid do |t|
      t.references :campaign, null: false, foreign_key: true, type: :uuid
      t.references :donor, null: false, foreign_key: true, type: :uuid

      t.decimal :amount, precision: 9, scale: 2
      t.boolean :match, default: false

      t.timestamps
    end
  end
end
