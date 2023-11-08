class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :assignee
      t.date :due_date
      t.string :priority

      t.timestamps
    end
  end
end
