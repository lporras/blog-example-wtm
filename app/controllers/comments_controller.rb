class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.create(comment_params)

    respond_to do |format|
      format.html do
        redirect_to post_path(@post)
      end
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to post_path(@post), notice: "Se ha eliminado correctamente"
    else
      redirect_to post_path(@post), error: "No se ha podido eliminar"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:message, :post_id)
    end
end