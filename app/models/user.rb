class User < ActiveRecord::Base
  has_many :events, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_secure_password
  validates_presence_of :email, :password, :name
  validates :email, length: {maximum: 30}, uniqueness: true
  validates_format_of :email, :with => /@/
  validates :password, length: {maximum: 30}
end
