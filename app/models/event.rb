class Event < ActiveRecord::Base
    has_many :comments
  	has_one :web_user
end
