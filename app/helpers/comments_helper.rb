module CommentsHelper
	def user_name(user_id)
		return User.find(user_id).email
	end
end
