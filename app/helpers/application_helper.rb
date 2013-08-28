module ApplicationHelper
	def user_email(id)
		return User.find(id).email
	end
end
