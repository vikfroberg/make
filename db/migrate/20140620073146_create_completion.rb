class CreateCompletion < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.references :completable, polymorphic: true
      t.timestamps
    end
  end
end
