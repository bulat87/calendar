class Event < ActiveRecord::Base
  belongs_to :user
  has_many :repeat, dependent: :destroy

  validates :event_start, :event_end, :recurrence, :title, presence: true

  after_save :set_date

  def set_date
    date = self.event_start
    duration = self.event_start..self.event_end

    while duration.include?(date)
      self.repeat.create(date: date)
      date = next_date(date)
    end
  end

  def next_date(date)
    case recurrence
    when 'Each day' || ""
      date.next_day
    when 'Each week'
      date.advance(days:7)
    when 'Each month'
      date.next_month
    when 'Each year'
      date.next_year
    end
  end
end
