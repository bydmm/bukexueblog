# -*- encoding : utf-8 -*-
require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.bukexue.net'
SitemapGenerator::Sitemap.create do
  add '/blogs', :changefreq => 'daily', :priority => 0.9
end
SitemapGenerator::Sitemap.ping_search_engines # called for you when you use the rake task
