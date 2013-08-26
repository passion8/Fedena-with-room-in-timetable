class CreateRoomAvailabilities < ActiveRecord::Migration
  def self.up
    create_table :room_availabilities do |t|
      t.time :start_time
      t.time :end_time
      t.integer :room_id
      t.string :day

      t.timestamps
    end
  end

  def self.down
    drop_table :room_availabilities
  end
end
