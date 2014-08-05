class MigrateClosedTasks < ActiveRecord::Migration

  def up
    Task.all.each do |task|
      if task.closed
        task.mark_as_complete
      end
    end
    remove_column :tasks, :closed
  end
end
