class PagesController < ApplicationController
  def index

  end

  def sitemap
    redirect_to 'https://example.s3.amazonaws.com/sitemaps/sitemap.xml.gz'
  end
end