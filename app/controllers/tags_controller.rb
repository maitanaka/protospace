class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used.page(params[:page]).per(21)
  end

  def show
    @prototypes = Prototype.tagged_with(params[:id]).page(params[:page]).per(8)
    render template: "prototypes/index"
  end
end
