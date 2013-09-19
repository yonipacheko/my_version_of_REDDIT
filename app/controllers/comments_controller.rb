class CommentsController < ApplicationController



  def create
    @creator = User.find(1) #just for now
    @post  = Post.find(params[:post_id])
    @comment = @post.comments.new(params.require(:comment).permit(:body))
    #@comment.post = @post
    @comment.user = current_user



    if @comment.save
      flash[:notice] = 'Comment added'
      redirect_to post_path(@post)

    else
      render post_path(@post)   # change this!!


    end




  end


end