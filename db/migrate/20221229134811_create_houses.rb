class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :type
      t.string :address
      t.string :city
      t.integer :zipcode
      t.string :country
      t.integer :size
      t.integer :floor
      t.string :bedrooms
      t.integer :bathrooms
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
