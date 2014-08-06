class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :tasks, :task_lists_id, :task_list_id
  end
end
