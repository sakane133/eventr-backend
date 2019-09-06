class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :type
      t.string :name
      t.integer :num_people
      t.integer :budget
      t.date :date

      t.timestamps
    end
  end
end
