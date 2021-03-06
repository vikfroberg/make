class Discussion < ActiveRecord::Base
  acts_as_commentable

  belongs_to :project

  accepts_nested_attributes_for :comments, reject_if: proc { |attributes| attributes[:comment].blank? }
end
