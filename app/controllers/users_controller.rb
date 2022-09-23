class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]= "Welcome to Knots Solutions, #{@user.username}"
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_params)
      flash[:notice]= "Edited successfully, #{@user.username}"
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end




  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def update_params
    params.require(:user).permit!
  end


end