class CommentsController < ApplicationController

  # def index
  #   @comments = Comment.all
  # end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype =  @comment.prototype
      @comments = @prototype.comments
      # binding.pry
      render "prototypes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
# end

  # def create
  #   @prototype = Prototype.find(params[:prototype_id])
  #   @prototypes=Prototype.all
  #   @comment = @prototype.comments.new(comment_params)

  #   if @comment.save
  #     redirect_to prototype_path(@comment.prototype) 
  
  #   else
  #     @comments = @prototype.comments
  #     binding.pry
  #     render template: "prototypes/show"
  #   end
  # end

  # def show
  #   @comment = Comment.find(params[:id])
  #   @comments = @prototype.comments
  # @comment = Comment.new 
  # end

  # private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
  

  # def comment_params
  #   params.require(:comment).permit(:content).merge(user_id: current_user.id)
  # end
end
