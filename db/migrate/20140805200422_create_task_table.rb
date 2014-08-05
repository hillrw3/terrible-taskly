class CreateTaskTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.integer :task_lists_id
    end
  end
end
