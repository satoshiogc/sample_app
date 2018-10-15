class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save # => validation
      # Success
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # GET "/users/#{@user.id}" => show
    else
      # Failure
      render 'new'
    end
  end
  
  def user_params
    params.require(:user).permit(
      :name, :email, :password, 
      :password_confirmation)
  end
end