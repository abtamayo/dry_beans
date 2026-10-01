class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.references :trip, null: false, foreign_key: true
      t.integer :action_type
      t.integer :status
      t.string :recipient_name
      t.string :address
      t.datetime :resolved_at

      t.timestamps
    end
  end
end
