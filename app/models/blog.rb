# -*- encoding : utf-8 -*-
class Blog < ActiveRecord::Base
  attr_accessible :content, :title, :tags, :tag_ids
  has_many :tags
  has_and_belongs_to_many :tags
  
  def self.find_by_tag(tag_name)
    Tag.find_by_name(tag_name).try(:blogs)
  end
end
