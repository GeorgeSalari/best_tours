# Change this to your host. See the readme at https://github.com/lassebunk/dynamic_sitemaps
# for examples of multiple hosts and folders.
# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.budget-tour.ru"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-#{ENV['AWS_REGION']}.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new( 
	aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
	aws_secret_access_key: ENV["AWS_SECRET_KEY"],
	fog_provider: 'AWS',
	fog_directory: ENV["S3_BUCKET_NAME"],
	fog_region: ENV["AWS_REGION"]
)

SitemapGenerator::Sitemap.create do
	#  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
	#  url shops_url
	#  Shop.all.each do |shop|
	#  	url shop
	#  end

	#  url boats_url
	#  Boat.all.each do |boat|
	#  	url boat
	#  end

	#  url carts_url

	#  url individual_tours_url
	#  IndividualTour.all.each do |tour|
	#  	url tour
	#  end

	#  url evening_shows_url
	#  EveningShow.all.each do |tour|
	#  	url tour
	#  end

	#  url avia_tours_url
	#  AviaTour.all.each do |tour|
	#  	url tour
	#  end

	#  url land_tours_url
	#  LandTour.all.each do |tour|
	#  	url tour
	#  end

	#  url phuket_tours_url
	#  PhuketTour.all.each do |tour|
	#  	url tour
	#  end

	# url sea_tours_url
	#  SeaTour.all.each do |tour|
	#  	url tour
	#  end

	#  url prices_url

	#  url individual_url

	#  url realty_rent_url

	#  url realty_buy_url

	#  url transfers_url

	#  url photoshoot_url

	#  url wedding_url

	#  url spa_url

 	add root_path

 	add shops_path
 	Shop.find_each do |shop|
   add shop_path(shop)
  end

  add boats_path
  Boat.find_each do |boat|
   add boat_path(boat)
  end

  add carts_path

  add individual_tours_path
  IndividualTour.find_each do |individual_tour|
   add individual_tour_path(individual_tour)
  end

  add evening_shows_path
  EveningShow.find_each do |evening_show|
   add evening_show_path(evening_show)
  end

  add avia_tours_path
  AviaTour.find_each do |avia_tour|
   add avia_tour_path(avia_tour)
  end

  add land_tours_path
  LandTour.find_each do |land_tour|
   add land_tour_path(land_tour)
  end

  add phuket_tours_path
  PhuketTour.find_each do |phuket_tour|
   add phuket_tour_path(phuket_tour)
  end

  add sea_tours_path
  SeaTour.find_each do |sea_tour|
   add sea_tour_path(sea_tour)
  end

  add prices_path

	add individual_path

	add realty_rent_path

	add realty_buy_path

	add transfers_path

	add photoshoot_path

	add wedding_path

	add spa_path

end

# You can have multiple sitemaps like the above – just make sure their names are different.

# Automatically link to all pages using the routes specified
# using "resources :pages" in config/routes.rb. This will also
# automatically set <lastmod> to the date and time in page.updated_at:
#
#   sitemap_for Page.scoped

# For products with special sitemap name and priority, and link to comments:
#
#   sitemap_for Product.published, name: :published_products do |product|
#     url product, last_mod: product.updated_at, priority: (product.featured? ? 1.0 : 0.7)
#     url product_comments_url(product)
#   end

# If you want to generate multiple sitemaps in different folders (for example if you have
# more than one domain, you can specify a folder before the sitemap definitions:
# 
#   Site.all.each do |site|
#     folder "sitemaps/#{site.domain}"
#     host site.domain
#     
#     sitemap :site do
#       url root_url
#     end
# 
#     sitemap_for site.products.scoped
#   end

# Ping search engines after sitemap generation:
#
ping_with "http://#{host}/sitemap.xml"