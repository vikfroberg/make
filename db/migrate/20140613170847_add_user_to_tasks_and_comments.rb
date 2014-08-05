class AddUserToTasksAndComments < ActiveRecord::Migration
  def change
    add_reference :tasks, :user, index: true
    add_reference :comments, :user, index: true
  end
end
