class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
      flash[:success]="User created"
    else
      redirect_to root_path
    end

  end

  def edit
    @user = User.find_by(params(:id))

  end

  def update
    @user = User.find_by(params(:id))
    
    if @user.update(user_params)
      redirect_to root_path
      flash[:success]="Account Updated"
    else
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find_by(params(:id))
    if @user.destroy
      redirect_to root_path
    end
  end

  private

  def user_params
   params.require(:user).permit(:email, :password, :username)
  end

end
