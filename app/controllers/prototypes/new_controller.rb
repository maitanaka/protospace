class Prototypes::NewController < ApplicationController

  def index
    @prototypes = Prototype.created_desc.page(params[:page]).per(8)
    render template: "prototypes/index"
  end

end
