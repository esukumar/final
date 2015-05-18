class EventActivity < ActiveRecord::Base
  belongs_to :event
  belongs_to :activity
  validates :activity_id, :uniqueness => {:scope => :event_id}
end
