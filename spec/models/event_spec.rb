require 'rails_helper'

describe Event do
  
  before :each do
    @event = create(:event)
  end

  describe "#new" do
    it "takes 4 params and returns Event object" do
      expect(@event).to be_an_instance_of Event
    end
  end

  describe "#title" do
    it "returns correct title" do
      expect(@event.title).to eq 'My new event'
    end 

    it "is invalid without title" do
      expect(build(:event, title: nil)).to_not be_valid 
    end
  end

  describe "#start_date" do
    it "returns correct start date" do
      expect(@event.event_start).to eq Date.today
    end 

    it "is invalid without start date" do
      expect(build(:event, event_start: nil)).to_not be_valid 
    end
  end

  describe "#end_date" do
    it "returns correct end date" do
      expect(@event.event_end).to eq Date.today + 1
    end 

    it "is invalid without end date" do
      expect(build(:event, event_end: nil)).to_not be_valid 
    end
  end

  describe "#recurrence" do
    it "returns correct recurrence" do
      expect(@event.recurrence).to eq "Each week"
    end

    it "is invalid without recurrence" do
      expect(build(:event, recurrence: nil)).to_not be_valid 
    end
  end  
end