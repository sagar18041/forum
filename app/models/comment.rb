class Comment < ActiveRecord::Base
	belongs_to :topic
	belongs_to :user
  attr_accessible :content, :topic_id, :user_id
end
