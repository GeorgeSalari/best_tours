# Change this to your host. See the readme at https://github.com/lassebunk/dynamic_sitemaps
# for examples of multiple hosts and folders.
host "www.example.com"

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url shops_url
  Shop.all.each do |shop|
  	url shop
  end

  url boats_url
  Boat.all.each do |boat|
  	url boat
  end

  url carts_url

  url individual_tours_url
  IndividualTour.all.each do |tour|
  	url tour
  end

  url evening_shows_url
  EveningShow.all.each do |tour|
  	url tour
  end

  url avia_tours_url
  AviaTour.all.each do |tour|
  	url tour
  end

  url land_tours_url
  LandTour.all.each do |tour|
  	url tour
  end

  url phuket_tours_url
  PhuketTour.all.each do |tour|
  	url tour
  end

	url sea_tours_url
  SeaTour.all.each do |tour|
  	url tour
  end

  url prices_url

  url individual_url

  url realty_rent_url

  url realty_buy_url

  url transfers_url

  url photoshoot_url

  url wedding_url

  url spa_url

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