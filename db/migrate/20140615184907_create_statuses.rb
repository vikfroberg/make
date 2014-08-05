class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :message
      t.references :project, index: true

      t.timestamps
    end
  end
end
