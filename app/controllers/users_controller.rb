class UsersController < ApplicationController
  def index
  	@user = User.all
  end

  def show
  	@user = User.find(params[:fname])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save 
      flash[:notice] = "Thank you for creating a new account."
  		redirect_to root_path
  	else
  		flash[:alert] = "We're sorry. A new account could not be created. Please try again later."
  		redirect_to new_user_path
  	end
  end

  private
  
  def user_params
  		params.require(:user).permit(:fname, :lname, :username, :email, :password)
  end
end
