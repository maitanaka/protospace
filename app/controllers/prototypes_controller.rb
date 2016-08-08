class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_prototype, only: [:show, :destroy, :update,:edit]
  before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, flash: { success: "Successfully uploaded your prototype!!" }
    else
      render :new
    end
  end

  def show
    @user = @prototype.user
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    @tags = @prototype.tag_list

  end

  def destroy
    @prototype.destroy
    redirect_to root_path, flash: { success: "Deleted your prototype" }
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path, flash: { success: "Updated your prototype" }
    else
      render :edit
    end
  end

  private

    def prototype_params
      params.require(:prototype).permit(
        :name,
        :catchcopy,
        :concept,
        images_attributes: [:id, :image_url, :status]
        ).merge(tag_list: params[:prototype][:tag])
    end

    def set_prototype
      @prototype = Prototype.find(params[:id])
    end

    def correct_user
    user = Prototype.find(params[:id]).user
    if current_user != user
      redirect_to root_path
    end
  end


end
