class RemoveCleanerIdToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :cleaner
  end
end
