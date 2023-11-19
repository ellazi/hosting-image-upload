class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.integer :square_meters
      t.text :description

      t.timestamps
    end
  end
end
