class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.string :cleaning_type
      t.integer :price
      t.time :estimated_time
      t.integer :number_of_visits
      t.string :address
      t.integer :size
      t.integer :floor
      t.string :bedrooms
      t.integer :bathrooms
      t.string :city
      t.integer :zipcode
      t.string :country
      t.string :further_info
      t.string :house_type
      t.references :user, null: false, foreign_key: true
      t.references :cleaner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
