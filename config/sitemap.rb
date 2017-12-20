# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.teslafintech.com"

SitemapGenerator::Sitemap.create do
  add root_path, :changefreq => 'monthly'
  add '/about', :changefreq => 'monthly'
  add '/services', :changefreq => 'monthly'
  add '/contact'

  # rails sitemap:refresh


  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(
  fogprovider: 'AWS',
  awsaccesskeyid: ENV['AWSACCESSKEYID'],
  awssecretaccesskey: ENV['AWSSECRETACCESSKEY'],
  fogdirectory: ENV['S3BUCKET'],
  fogregion: ENV['AWS_REGION'])

SitemapGenerator::Sitemap.sitemapshost = "https://s3-#{ENV['AWSREGION']}.amazonaws.com/#{ENV['S3_BUCKET']}/"
SitemapGenerator::Sitemap.sitemapspath = 'sitemaps/'
SitemapGenerator::Sitemap.publicpath = 'tmp/'