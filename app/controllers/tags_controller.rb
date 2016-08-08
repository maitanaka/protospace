class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @prototypes = Prototype.tagged_with(params[:id])
    render template: "prototypes/index"
  end
end
