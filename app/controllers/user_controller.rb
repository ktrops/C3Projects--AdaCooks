class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(session[:user_id])
    @recipes = @user.recipes 
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :image)
  end

end
