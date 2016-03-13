class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :event, index: true
      t.references :user, index: true
      t.text :body

      t.timestamps
    end
  end
end
