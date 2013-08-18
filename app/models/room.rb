class Room < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  has_many :timetable_entries


  def self.active
  	Room.all(:conditions => [ 'is_empty is true' ])
  end
end
