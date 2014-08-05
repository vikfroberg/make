class Todo < ActiveRecord::Base
  def self.incompleted
    where(completed_at: nil).order('created_at DESC')
  end

  def complete
    update_attribute(:completed_at, Time.now)
  end

  def uncomplete
    update_attribute(:completed_at, nil)
  end
end
