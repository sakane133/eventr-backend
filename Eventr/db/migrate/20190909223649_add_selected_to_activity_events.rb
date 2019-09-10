class AddSelectedToActivityEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_events, :selected, :boolean, :default => false
  end
end
