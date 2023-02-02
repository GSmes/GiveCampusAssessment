class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns, id: :uuid do |t|
      t.string :name, null: false
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
