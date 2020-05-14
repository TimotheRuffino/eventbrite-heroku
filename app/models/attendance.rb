class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def att_event
    @events = Event.event_to_att
end

end