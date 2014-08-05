class Project < ActiveRecord::Base
  belongs_to :user

  has_many :tasks
  has_many :discussions

  def self.active
    where(active: true)
  end
end
