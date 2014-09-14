class Event < ActiveRecord::Base
  belongs_to :user

  validates :event_start, :event_end, :recurrence, :title, presence: true

  def next_date(date)
    case recurrence
    when 'Each day' || ''
      date.next_day
    when 'Each week'
      date + 7.days
    when 'Each month'
      date.next_month
    when 'Each year'
      date.next_year
    end
  end

  def accepted_dates
    current_date = event_start.clone
    dates = []
    until current_date > event_end
      dates << current_date if current_date <= event_end
      current_date = next_date(current_date)
    end
    dates
  end

  def occurs_at?(date)
    accepted_dates.include?(date)
  end
end