class AddAvailabilityIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :availability
  end
end
