module BlogsHelper
  def join_tags(blog)
    blog.tags.map { |t| t.name }.join(", ") 
  end
end
