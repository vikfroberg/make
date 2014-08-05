require 'spec_helper'

describe Project do
  it { should belong_to :user }
  it { should have_many :tasks }
  it { should have_many :discussions }
end
