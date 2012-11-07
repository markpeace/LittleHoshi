module SessionsHelper

	def authenticate_user
		redirect_to root_path unless user_signed_in?
	end
	
	def user_signed_in?
		current_user != nil
	end
	
	def current_user
		return nil unless session[:user_id]
		User.find_by_id(session[:user_id])
	end

end
