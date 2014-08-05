require 'spec_helper'

describe Discussion do
  # it { should act_as_commentable }
  it { should accept_nested_attributes_for :comments }
end
