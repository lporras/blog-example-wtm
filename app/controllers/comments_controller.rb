class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.create(comment_params)

    respond_to do |format|
      format.html do
        redirect_to @commentable, notice: "Comentario creado"
      end
      format.json do
        render json: @comment.to_json
      end
      format.js
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    if @comment.destroy
      redirect_to @commentable, notice: "Se ha eliminado correctamente"
    else
      redirect_to @commentable, error: "No se ha podido eliminar"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:message)
    end
end