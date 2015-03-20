class PageSessionsController < ApplicationController
def new
  end

  def create
    user = User.find_by(email: page_session_params[:email])
    if user && user.authenticate(page_session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successful Login'
    else
      redirect_to new_page_session_path, notice: 'Unsuccessful Login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Bye!'
  end

  private

  def page_session_params
    params.require(:page_session).permit(:email, :password)
  end
end
