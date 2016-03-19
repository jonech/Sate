class Comment < ActiveRecord::Base
	has_one :web_user
end
