class Activity < ActiveRecord::Base
  has_many :event_activities
  has_many :events, through: :event_activities
  validates_presence_of :title
  validates :title, length: {maximum: 30}, :uniqueness => {:case_sensitive => false}
end
