class Comment < ActiveRecord::Base
  belongs_to :note
  validates_presence_of :desc
end
