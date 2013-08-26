class Room < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  has_many :timetable_entries
  has_many :room_availabilities


  def self.active
  	Room.all(:conditions => [ 'is_empty is true' ])
  end

  def available?(start_time, end_time , day)
    self.room_availabilities.each do |ra|
      unless ra.available?(start_time , end_time , day)
        return false
      end
    end
    return true
  end


end

