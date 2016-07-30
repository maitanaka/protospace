class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!


  def index
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to ({:action => 'show'}), :notice => 'Successfully edited your account!'
    else
      
      # redirect_to edit_user_path, alert: 'Failed to edit your profile'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :group, :profile, :work)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
