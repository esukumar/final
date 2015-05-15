class Activity < ActiveRecord::Base
  has_many :event_activities
  has_many :events, through: :event_activities
  validates_presence_of :title
end
