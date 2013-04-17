# -*- encoding : utf-8 -*-
module BlogsHelper
  def join_tags(blog)
    blog.tags.map { |t| t.name }.join(", ") 
  end
  def self.join_tags(blog)
    blog.tags.map { |t| t.name }.join(", ") 
  end
end
