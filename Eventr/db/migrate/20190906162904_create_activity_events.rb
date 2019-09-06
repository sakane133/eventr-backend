class CreateActivityEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_events do |t|
      t.integer :activity_id
      t.integer :event_id

      t.timestamps
    end
  end
end
