class CommentsController < ApplicationController

  before_action :set_comment, only: [:vote]



  def create
    @posts = Post.all
    @post  = Post.find_by slug: params[:post_id]
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post
    @comment.user=  current_user

    if @comment.save
      flash[:notice] = 'Comment added'
      redirect_to post_path(@post)

    else
      render 'posts/show'   # change this!!
    end

  end

  def vote
    @post  = Post.find_by slug: params[:post_id]
    vote_action(@comment, @post)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
