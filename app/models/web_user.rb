class WebUser < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :comments
end
