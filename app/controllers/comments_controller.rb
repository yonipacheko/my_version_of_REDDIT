class CommentsController < ApplicationController

  before_action :set_comment, only: [:vote]



  def create

    @post  = Post.find(params[:post_id])
    @comment = @post.comments.new(params.require(:comment).permit(:body))
    #@comment.post = @post
    @comment.user=  current_user

    if @comment.save
      flash[:notice] = 'Comment added'
      redirect_to post_path(@post)

    else
      render post_path(@post)   # change this!!
    end

  end

  def vote
    vote_action(@comment, @post)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
