class Comment < ActiveRecord::Base
	resourcify
	belongs_to :topic
	belongs_to :user
  attr_accessible :content, :topic_id, :user_id
  validates :content, presence: true
end
