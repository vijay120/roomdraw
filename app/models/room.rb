class Room < ActiveRecord::Base
  has_many :request_rooms
  has_many :comments
  has_many :users, :through => :request_rooms
  validates :name, presence: true
  validates :code, presence: true
  validates :size, presence: true
end
