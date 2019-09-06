class AddLinkToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :link, :string
  end
end
