class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @show_greeting = true
  end

  def create
    @prototype = Prototype.new(prototype_params)
    @prototype.user_id = current_user.id

    if @prototype.save
        redirect_to root_path, notice: 'Prototype and Comment were successfully created.'
      else
        render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
    @comment = Comment.new
    @comment.prototype = @prototype 
  end

  def edit
    @prototype = Prototype.find(params[:id])
    if @prototype.user != current_user
      redirect_to root_path, alert: '編集権限がありません'
    end
  end

  def update
    @prototype = Prototype.find(params[:id])

    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'Prototype was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path, notice: 'Prototype was successfully deleted.'
  end

  private

  def prototype_params
    params.require(:prototype).permit(:content, :title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

 

end