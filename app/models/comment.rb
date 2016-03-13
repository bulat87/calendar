class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validates :event_id, :body, :presence => true
end
