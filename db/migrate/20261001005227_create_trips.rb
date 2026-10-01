class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :route, null: false, foreign_key: true
      t.date :scheduled_date
      t.string :status

      t.timestamps
    end
  end
end
