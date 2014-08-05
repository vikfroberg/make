class PopulateStates < ActiveRecord::Migration
  def up
    State.create(name: 'Inbox')
    State.create(name: 'Next Up')
    State.create(name: 'In Progress')
    State.create(name: 'Code Review')
    State.create(name: 'Ready for Production')
    State.create(name: 'Live')
    State.create(name: 'Archive')
  end

  def down
    State.find_by_name('Inbox').destroy
    State.find_by_name('Next Up').destroy
    State.find_by_name('In Progress').destroy
    State.find_by_name('Code Review').destroy
    State.find_by_name('Ready for Production').destroy
    State.find_by_name('Live').destroy
    State.find_by_name('Archive').destroy
  end
end
