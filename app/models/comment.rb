class Comment < ActiveRecord::Base
  belongs_to :note
  belongs_to :image
  belongs_to :user
  validates_presence_of :desc
  validates :desc, length: {maximum: 200}
end
