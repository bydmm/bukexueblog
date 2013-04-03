class Tag < ActiveRecord::Base
  belongs_to :blog
  attr_accessible :name, :blogs
  has_and_belongs_to_many :blogs
end
