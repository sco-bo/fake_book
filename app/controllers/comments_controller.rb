class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html {redirect_to :back, notice: 'Comment successfully created'}
        format.json {render json: @comment, status: :created, location: @comment}
      else
        format.html {render action: :new}
        format.json {render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :comment)
    end
end
