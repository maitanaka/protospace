class PrototypesController < ApplicationController
  before_action :authenticate_user!


  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
      @prototype = Prototype.new(create_params)
    if @prototype.save
      redirect_to controller: :prototypes, action: :index
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @user = User.find(@prototype.user_id)
  end

  private

    def create_params
      params.require(:prototype).permit(:name, :catchcopy, :concept, images_attributes: [:image_url, :status]).merge(user_id: current_user.id)
    end

end
