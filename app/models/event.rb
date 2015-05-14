class Event < ActiveRecord::Base
  has_many :notes
  has_many :images
  validates_presence_of :title
end
