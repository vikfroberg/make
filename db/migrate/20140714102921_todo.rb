class Todo < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :content
      t.references :task
    end
  end
end
