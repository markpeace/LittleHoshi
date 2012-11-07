class SessionsController < ApplicationController
  def new
	@user=User.new
  end

  def create
	@user=User.new(params[:user])
	if u=User.authenticate(@user.email, @user.password) then
		redirect_to root_path
	else
		@user.errors.add(:email, "Sorry, your login details seem to be wrong")
		render :new
	end
  end

  def destroy
  end
end
