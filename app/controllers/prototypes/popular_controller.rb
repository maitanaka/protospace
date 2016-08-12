class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.likes_desc.page(params[:page]).per(8)
    render template: "prototypes/index"
  end

end
