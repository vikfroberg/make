class ActiveRecordToActAsCommentable < ActiveRecord::Migration
  def change
    remove_index(:comments, name: "index_comments_on_task_id")

    add_column :comments, :title, :string, {:limit => 50, :default => ""}
    rename_column :comments, :body, :comment
    rename_column :comments, :task_id, :commentable_id
    add_column :comments, :commentable_type, :string
    add_column :comments, :role, :string, :default => "comments"

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
  end
end
