class UsersController < ApplicationController

def index
	@users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
	@user.last_signed_in_at = Time.now
    if @user.save
	  session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successful sign up'
    else
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
