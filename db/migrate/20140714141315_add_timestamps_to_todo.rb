class AddTimestampsToTodo < ActiveRecord::Migration
  def change
    add_timestamps :todos
  end
end
