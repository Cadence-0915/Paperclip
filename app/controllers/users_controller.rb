class UsersController < ApplicationController
  def index
  	@user = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	if @user.save 
      flash[:notice] = "Thank you for creating a new account."
  		redirect_to @user
  	else
  		flash[:alert] = "We're sorry. A new account could not be created. Please try again later."
  		redirect_to new_user_path
  	end
  end

  private
  
  def user_params
  		params.require(:user).permit(:fname, :lname, :username, :email, :password, :avatar)
  end
end
