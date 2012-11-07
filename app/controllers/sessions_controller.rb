class SessionsController < ApplicationController
  def new
	@user=User.new
  end

  def create
	@user=User.new(params[:user])
	if u=User.authenticate(@user.email, @user.password) then
		session[:user_id]=u.id
		redirect_to root_path
	else
		@user.errors.add(:email, "Sorry, your login details seem to be wrong")
		render :new
	end
  end

  def destroy
	session[:user_id]=nil
	redirect_to root_path
  end
end
