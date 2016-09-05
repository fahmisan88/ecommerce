class FacebookController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:id] = user.id
    redirect_to root_url
    flash[:success] = "Welcome back #{current_user.username}"
  end

  def destroy
    session.delete(:id)
    redirect_to root_url
    flash[:success] = "You've been logged out"
  end

end
