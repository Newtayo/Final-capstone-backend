class CreateLaptops < ActiveRecord::Migration[7.0]
  def change
    create_table :laptops do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :price
      t.integer :model_year
      t.string :rom_size
      t.string :ram_size

      t.timestamps
    end
  end
end
