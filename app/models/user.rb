class User < ActiveRecord::Base
  has_many :projects

  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
