class AddCleanerIdToAvailabilities < ActiveRecord::Migration[7.0]
  def change
    add_reference :availabilities, :cleaner
  end
end
