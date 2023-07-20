class CreateLaptops < ActiveRecord::Migration[7.0]
  def change
    create_table :laptops do |t|

      t.string :name
      t.text :description
      t.string :photo_url
      t.string :model_year
      t.integer :price
      t.string :rom_size
      t.string :ram_size

      t.timestamps
    end

    add_index :laptops, :photo_url, unique: true
  end
end

