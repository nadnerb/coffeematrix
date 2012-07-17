class SessionsController < ApplicationController
  def create
    user = login(params[:username], params[:password])
    if user
      redirect_back_or_to root_url, :notice => "Successfully logged in"
    else
      flash.now.alert = "Username or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Successfully logged out"
  end
end
