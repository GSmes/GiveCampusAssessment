class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches, id: :uuid do |t|
      t.integer :kind, default: 0, index: true

      t.decimal :amount, precision: 9, scale: 2
      t.decimal :remaining_balance, precision: 9, scale: 2

      t.references :campaign, null: false, foreign_key: true, type: :uuid
      t.references :donor, null: false, foreign_key: true, type: :uuid

      t.integer :state, default: 0, index: true

      t.timestamps
    end
  end
end
