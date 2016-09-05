class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: user_params[:email])
               &.authenticate(user_params[:password])

    if user
      session[:id] = user.id

      if user.admin?
        redirect_to rails_admin_path
        flash[:success] = "Welcome back #{current_user.username}"

      else
        redirect_to root_path
        flash[:success] = "Welcome back #{current_user.username}"
      end

    else
      flash[:danger] = "Error logging in"
      render :new
    end

  end

  def destroy
    session.delete(:id)
    redirect_to root_path
    flash[:success] = "You've been logged out"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
