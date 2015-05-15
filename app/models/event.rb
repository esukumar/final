class Event < ActiveRecord::Base
  has_many :notes
  has_many :images
  has_many :event_activities
  has_many :activities, through: :event_activities
  validates_presence_of :title
end
