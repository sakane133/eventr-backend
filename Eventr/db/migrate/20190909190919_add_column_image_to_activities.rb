class AddColumnImageToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :image, :string
  end
end
