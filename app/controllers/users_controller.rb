class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

  def edit
    @user = User.find_by(:id params[:id])
  end

  def update
    @user = User.find_by(:id params[:id])
      if @user.update(user_params)
        flash[:success]="Account Updated"
        redirect_to root_path
      else
        redirect_to edit_user_path
      end
  end

  def destroy
    @user = User.find_by(:id params[:id])
    if @user.destroy
      redirect_to root_path
    end
  end

  private

  def user_params
   params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end

end
