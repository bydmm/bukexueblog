# -*- encoding : utf-8 -*-
module ApplicationHelper
  
  def morebreak(text)
    moshi = /\<\!\-\- more \-\-\>/
    pre = moshi.match(text).try(:pre_match)
    pre = pre ? pre : text
  end
  
  def markdown(text)
    options = {   
        :autolink => true, 
        :space_after_headers => true,
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :hard_wrap => true,
        :strikethrough =>true
      }
    markdown = Redcarpet::Markdown.new(HTMLwithCodeRay,options)
    markdown.render(h(text)).html_safe
  end
  
  class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
  end
  
end

