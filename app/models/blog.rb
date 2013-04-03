class Blog < ActiveRecord::Base
  attr_accessible :content, :title, :tags, :tag_ids
  has_many :tags
  has_and_belongs_to_many :tags
  
  def self.post(tag_name)
    Tag.find_by_name(yag_name).try(:blogs)
  end
end
