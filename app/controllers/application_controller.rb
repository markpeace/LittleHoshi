class ApplicationController < ActionController::Base
  protect_from_forgery
	
	helper_method :current_user, :user_signed_in?


	def authenticate_admin!
		return redirect_to root_path unless user_signed_in?
		redirect_to root_path unless current_user.is_admin
	end

	def authenticate_user!
		return redirect_to root_path unless user_signed_in?
		true
	end
	
	def user_signed_in?
		current_user != nil
	end
	
	def current_user
		return nil unless session[:user_id]
		User.find_by_id(session[:user_id])
	end

end
