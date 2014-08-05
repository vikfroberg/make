class AddClosedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :closed, :bool, null: false, default: false
  end
end
