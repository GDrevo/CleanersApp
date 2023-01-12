class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.time :start_time
      t.time :end_time
      t.integer :hours_available

      t.timestamps
    end
  end
end
