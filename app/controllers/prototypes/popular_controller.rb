class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.likes_desc
    render template: "prototypes/index"
  end

end
