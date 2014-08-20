class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :recurrence
      t.references :user, index: true

      t.timestamps
    end
  end
end
