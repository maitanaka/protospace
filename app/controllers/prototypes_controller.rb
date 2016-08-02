class PrototypesController < ApplicationController

  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = Prototype.create(create_params)
    redirect_to controller: :prototypes, action: :index
  end

  def show
  end

  private

    def create_params
      params.require(:prototype).permit(:name, :catchcopy, :concept, images_attributes: [:image, :status]).merge(user_id: current_user.id)
    end

end
