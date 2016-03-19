require 'nokogiri'
require 'open-uri'
require 'json'


@MELB_UNI_FOOD_COOP_ID = 151718798174562
@oauth_access_token = "CAACEdEose0cBAMkdOZAkNZATMKYJHtZBNfiiSuzVxl81YRSZAUhNdm8MHgVgvZA7SGT1RSvJ5GtpEBc1B4ze8Tkl9oYahnKGJDMIEAo2B4p1Ynq0ZA6wZAZC4Oe4zve0qGdRmf30kZAKAtkL3Pke1bg9mE2dNnZC2Od4XExatwkshz1K4NEZBC6jxed4kCnZAkpVVhfuDrLNW8mNqgZDZD"


namespace :fbscrape do

	task :page => :environment do

		@graph = Koala::Facebook::API.new(@oauth_access_token)

		profile = @graph.get_object(@MELB_UNI_FOOD_COOP_ID)
		puts "company: " + profile["name"]
		puts profile["location"]["city"]
		puts profile["location"]["latitude"]
		puts profile["location"]["longitude"]


		feed = @graph.get_connections(@MELB_UNI_FOOD_COOP_ID, "feed")
		feed.each do |f|
			
=begin			
			f.each do |key, value|
				puts "#{key} => #{value}"
			end
=end

			puts f["message"]
			puts f["created_time"]
			puts f["likes"]
			puts f["picture"]

			puts ""
		end


	end

end