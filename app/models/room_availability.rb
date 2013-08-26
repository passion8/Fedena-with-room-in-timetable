class RoomAvailability < ActiveRecord::Base
  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_uniqueness_of :start_time , :scope  => [:room_id , :day]
  validates_presence_of :room_id
  belongs_to :room

  def available?(start_time, end_time , day)
    if self.start_time !=  start_time && self.end_time != end_time  && self.day != day # 5 - 10 (16-20,1-4)
      if start_time > self.start_time && end_time > self.end_time #16 - 20 
        return true
      end
      if start_time < self.start_time && end_time < self.start_time #1-4
        return true
      end
      return false
    else
      return false
    end  
  end

end