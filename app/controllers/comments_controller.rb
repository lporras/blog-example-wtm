class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.js
      else
        format.html do
          @comments = @post.comments.all
          render template: "posts/show"
        end
      end
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