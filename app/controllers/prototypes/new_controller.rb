class Prototypes::NewController < ApplicationController

  def index
    @prototypes = Prototype.created_desc
    render template: "prototypes/index"
  end

end
