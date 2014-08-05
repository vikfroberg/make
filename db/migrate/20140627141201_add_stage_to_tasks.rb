class AddStageToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :state, :default => State.first
    promoted = State.find(2)
    closed = State.find(6).id
    Task.where(promoted: true).update_all(state_id: promoted)
    Task.closed.each do |task|
      task.state_id = closed
      task.save
    end
  end
end
