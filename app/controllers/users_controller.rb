class UsersController < ApplicationController
  before_action :set_user

  def index
  end

  def show
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to action: :show
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :group, :profile, :work)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
