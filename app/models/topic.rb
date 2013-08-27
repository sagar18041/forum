class Topic < ActiveRecord::Base
	belongs_to :category
	has_many :comments
	belongs_to :user
  attr_accessible :category_id, :name, :post, :user_id
end
