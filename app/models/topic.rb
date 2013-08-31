class Topic < ActiveRecord::Base
	resourcify
	belongs_to :category
	has_many :comments
	belongs_to :user
  attr_accessible :category_id, :name, :post, :user_id
  validates :name, :post, presence: true
  scope :search_category, ->(category_id){where('category_id = ?',category_id)}
  def to_param
    "#{id} #{name}".parameterize
  end
end
