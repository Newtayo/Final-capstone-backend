class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :laptop_id
      t.string :city
      t.date :date
      t.string :hour

      t.timestamps
    end

    add_index :reservations, [:laptop_id, :date, :hour], unique: true
  end
end
