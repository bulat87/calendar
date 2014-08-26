class AddStartEndDateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_start, :date
    add_column :events, :event_end, :date
    remove_column :events, :date, :date
  end
end
