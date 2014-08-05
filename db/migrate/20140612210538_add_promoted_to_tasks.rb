class AddPromotedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :promoted, :bool, null: false, default: false
  end
end
