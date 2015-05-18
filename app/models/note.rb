class Note < ActiveRecord::Base
  belongs_to :event
  has_many :comments
  validates_presence_of :title, :desc
  validates :title, length: {maximum: 30}
  validates :desc, length: {maximum: 500}
end
