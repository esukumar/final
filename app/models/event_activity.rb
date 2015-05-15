class EventActivity < ActiveRecord::Base
  belongs_to :event
  belongs_to :activity
end
