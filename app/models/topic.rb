class Topic < ActiveRecord::Base
	resourcify
	belongs_to :category
	has_many :comments
	belongs_to :user
  attr_accessible :category_id, :name, :post, :user_id
  validates :name, :post, presence: true
  def to_param
    "#{id} #{name}".parameterize
  end
end
