module TopicsHelper
	def category_name(id)
		return Category.find(id).name
	end
end
