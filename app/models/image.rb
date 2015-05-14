class Image < ActiveRecord::Base
  belongs_to :event
  has_many :comments
  validates_presence_of :title, :picture
end
