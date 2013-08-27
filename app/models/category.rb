class Category < ActiveRecord::Base
	has_many :topics
  attr_accessible :name
end
