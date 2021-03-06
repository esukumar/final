class Image < ActiveRecord::Base
  belongs_to :event
  has_many :comments, :dependent => :destroy
  validates_presence_of :title, :picture
  validates :title, length: {maximum: 30}
end
