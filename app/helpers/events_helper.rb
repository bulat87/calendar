module EventsHelper
  def find_events_at(date)
    @events.select do |event|
      event.occurs_at?(date)
    end
  end
end