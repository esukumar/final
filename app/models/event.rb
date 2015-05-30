class Event < ActiveRecord::Base
  has_many :notes, :dependent => :destroy
  has_many :images, :dependent => :destroy
  has_many :event_activities, :dependent => :destroy
  has_many :activities, through: :event_activities
  belongs_to :user
  validates_presence_of :title
  validates :title, length: {maximum: 30}, uniqueness: true
  paginates_per 5
end
