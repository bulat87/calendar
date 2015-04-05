FactoryGirl.define do
  factory :event do
    title "My new event"
    event_start Date.today
    event_end Date.today + 1
    recurrence "Each week"
  end
end
