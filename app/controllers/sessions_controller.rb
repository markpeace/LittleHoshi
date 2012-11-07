class SessionsController < ApplicationController
  def new
	@user=User.new
  end

  def create
	@user=User.new(params[:user]).authenticate
	#@user.authenticate
	render :new
  end

  def destroy
  end
end
