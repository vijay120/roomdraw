class RequestRoom < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
end
