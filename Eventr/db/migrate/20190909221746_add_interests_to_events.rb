class AddInterestsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :interests, :string
  end
end
