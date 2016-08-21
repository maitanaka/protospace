class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_user


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
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :group, :profile, :work, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
