class Task < ActiveRecord::Base
  acts_as_commentable

  # default_scope { order 'created_at DESC' }

  belongs_to :user

  has_many :todos
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).tasks.incompleted
  end

  def self.incompleted
    where(completed_at: nil)
  end

  def tag_list
    tag_names = []
    tags.each do |tag|
      tag_names << tag.name
    end
    tag_names.join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.find_or_create_by!(name: n.strip)
    end
  end

  def complete
    update_attribute(:completed_at, Time.now)
  end

  def uncomplete
    update_attribute(:completed_at, nil)
  end
end
