class AddActiveToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :active, :bool, :default => true
  end
end
