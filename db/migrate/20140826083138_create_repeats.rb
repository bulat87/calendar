class CreateRepeats < ActiveRecord::Migration
  def change
    create_table :repeats do |t|
      t.integer :event_id
      t.date :date

      t.timestamps
    end
  end
end
