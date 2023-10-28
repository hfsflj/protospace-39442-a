class PostsController < ApplicationController
  def new
   @Prototype=Prototype.all
  end

  def create
    @Prototype=Prototype.all
  end

end
