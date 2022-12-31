class ChangeColumnInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column_null :bookings, :cleaner_id, from: false, to: true
  end
end
