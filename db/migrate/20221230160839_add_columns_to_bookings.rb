class AddColumnsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :new_user_name, :string
    add_column :bookings, :new_user_email, :string
    add_column :bookings, :new_user_password, :string
    add_column :bookings, :new_user_phone, :string
  end
end
