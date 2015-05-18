class Comment < ActiveRecord::Base
  belongs_to :note
  belongs_to :image
  validates_presence_of :desc
  validates :title, length: {maximum: 200}
end
