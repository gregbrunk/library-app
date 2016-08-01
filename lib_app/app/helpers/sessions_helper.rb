module SessionsHelper
	def login(user)
		session[:user_id] = user.id
		@current_user = user
	end

	def current_user
		user = session[:user_id]
		if user != nil
			@current_user ||= User.find(session[:user_id])
		end
	end

	def logged_in?
		if current_user == nil
		  redirect_to "/sign_in"
		end
	end
end
