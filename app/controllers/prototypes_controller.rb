class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_prototype, only: [:show, :destroy, :edit, :update]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to prototypes_path, flash: { success: "Successfully uploaded your prototype!!" }
    else
      render :new
    end
  end

  def show
    @user = @prototype.user
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, flash: { success: "Deleted your prototype" }
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototypes_path, flash: { success: "Updated your prototype" }
    else
      render :edit
    end
  end

  private

    def prototype_params
      params.require(:prototype).permit(:name, :catchcopy, :concept, images_attributes: [:id, :image_url, :status]).merge(user_id: current_user.id)
    end

    def set_prototype
      @prototype = Prototype.find(params[:id])
    end

end
