class HomeController < ApplicationController
  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find_by(id:params[:id])
    @user.update!(user_params)
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
