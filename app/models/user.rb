class User < ActiveRecord::Base
  has_many :request_rooms
  has_many :rooms, :through => :request_rooms
  before_destroy :ensure_no_request_is_referenced
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :draw_number, presence: true
  has_secure_password
  
  def ensure_no_request_is_referenced
    if request_rooms.empty?
      return true
    else
      errors.add(:base, 'Room request present')
      return false
    end
  end
  
  
end
