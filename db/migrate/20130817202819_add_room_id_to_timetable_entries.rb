class AddRoomIdToTimetableEntries < ActiveRecord::Migration
  def self.up
  	add_column :timetable_entries , :room_id , :integer
  end

  def self.down
  	remove_column :timetable_entries , :room_id 
  end
end
