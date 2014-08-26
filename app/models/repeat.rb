class Repeat < ActiveRecord::Base
  belongs_to :event

  validates :event_id, :date, presence: true
end
