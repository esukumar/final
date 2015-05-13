class Event < ActiveRecord::Base
  has_many :notes
  validates_presence_of :title
end
