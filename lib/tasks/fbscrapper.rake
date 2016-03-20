require 'nokogiri'
require 'open-uri'
require 'json'


@MELB_UNI_FOOD_COOP_ID = 151718798174562
@MELB_BEER_FOOD_FEST = 399600923500940
@MELB_FOOD_WINE_FEST = 164585291465
@oauth_access_token = "CAACEdEose0cBAJcT1yVqbGBsmkx0BWXFcgR9dB7aYl06ZCnf9nFNvBCgURbDNH502814OnuZC8Lm973vdeePwtZCGPFPZBpGIravJXuowciiZAl6VcGFykLouZA18pgT9uLl6aclL1EKCEQ3zt3P6FREWBPbE7ZCQZA6sGx1ALcZA54pL0lVXyJiM1OUSBVJTUZB4sZCbBL9EP4oAZDZD"


@ALL_SITE = [@MELB_UNI_FOOD_COOP_ID, @MELB_BEER_FOOD_FEST, @MELB_FOOD_WINE_FEST]

namespace :fbscrape do

	desc "scrape PAGE from facebook"
	task :page => :environment do

		@graph = Koala::Facebook::API.new(@oauth_access_token)

		@ALL_SITE.each do |page|
			# retrieve name, latitude, longitude, and city of the page organization
			profile = @graph.get_object(page)

			if (profile["name"] != nil)
				organisation = profile["name"]
			end

			if (profile["location"]["latitude"] != nil)
				lat = profile["location"]["latitude"]
			end

			if (profile["location"]["longitude"] != nil)
				long = profile["location"]["longitude"]
			end

			if (profile["location"]["city"] != nil)
				place = profile["location"]["city"]
			end

			if (profile["website"] != nil)
				org_link = profile["website"]
			end


			# retrieve the feed of the page
			feed = @graph.get_connections(page, "feed")
			feed.each do |f|
				

				if (f["message"] != nil)
					description = f["message"]
				end
				
				if (f["likes"] != nil && f["likes"]["data"] != nil)
					like = f["likes"]["data"].length
				else
					like = 0
				end

				if (f["link"] != nil)
					page_link = f["link"]
					url = f["link"]
					
					# only store image url if the feed has picture
					if /photos/.match(url)
						doc = Nokogiri::HTML(open(url))
						shorten = doc.css(".hidden_elem").to_s.gsub!(/.*?(?=uiScaledImageContainer)/im,"")
						shorten = shorten.to_s.sub(/.*(uiScaledImageContainer).*(src\=\")/, '')
						shorten = shorten.to_s.sub(/((\"\s(alt))|(\"\s(style))).*/im,'')

						while (/\&amp\;/.match(shorten))
							shorten = shorten.to_s.sub(/\&amp\;/,'&')
						end
					end
					#puts shorten
				elsif (f["picture"] != nil)
					imageurl = f["picture"]
				end

				# save to database
				Event.create(place: place, lat: lat, long: long, organisation: organisation, description: description, 
					like: like, imageurl: shorten, org_link: org_link, page_link: page_link)
			end
		end
	end

end