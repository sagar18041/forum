module TopicsHelper
	def category_name(id)
		return Category.find(id).name if id.present? and id !=0
	end
end
