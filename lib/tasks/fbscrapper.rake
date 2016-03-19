require 'nokogiri'
require 'open-uri'
require 'json'


@MELB_UNI_FOOD_COOP_ID = 151718798174562
@MELB_BEER_FOOD_FEST = 399600923500940
# @oauth_access_token = "CAACEdEose0cBAHttGw8w3uurnRTcxBCfGjxGZBmTzpkwZBZC9KPvVbdZCnKKaujGcQLT5PDJt0IcCMfxUtZAEcrIw5xm5ZATdJzUNXMIQa4XZAUZC62ak7AM9T0PgP2IHcWM4423dEE8DtCGjv3BIZBPbXwBvymXCvAkbKBrbfZCL0XFIZBdcvZCeVVUEA0GBeAlkX95dyxM9I1zuBHVkJdSwrqE"
@oauth_access_token = "CAAYcTdb4G3MBAH0wD4ZAkD2A8ZBwFLN3qMii3hlg8Nc4zHbTNp2Bvi6nwstLZAMkdcuD6aFZBH2bFWPZARiv0ifVv1JWP1UExpTmpCnJEPMzxWPXZBgz2xhr1aW0TOqm7kG2Wn2z7OJ9A9qtpc7AQ82GknZCtrPhGZCuAY0ZCPnoWhwKgbtNAWekalf7JfNoa4aTxYtZAdkYzx4SB5FeMAAqoU"

@ALL_SITE = [@MELB_UNI_FOOD_COOP_ID, @MELB_BEER_FOOD_FEST]

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
				end

				if (f["link"] != nil)
					imageurl = f["link"]
				elsif (f["picture"] != nil)
					imageurl = f["picture"]
				end

				# save to database
				Event.create(place: place, lat: lat, long: long, organisation: organisation,
					description: description, like: like, imageurl: imageurl, org_link: org_link)
			end
		end
	end

end