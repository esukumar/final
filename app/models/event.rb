class Event < ActiveRecord::Base
  has_many :notes
  has_many :images
  has_many :event_activities
  has_many :activities, through: :event_activities
  belongs_to :user
  validates_presence_of :title
  validates :title, length: {maximum: 30}, uniqueness: true
end
