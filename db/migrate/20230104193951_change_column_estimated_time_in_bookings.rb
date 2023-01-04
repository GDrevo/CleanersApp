class ChangeColumnEstimatedTimeInBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :estimated_time
    add_column :bookings, :estimated_time, :string
  end
end
