class CommentsController < ApplicationController



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
    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])

    if @comment.votes.find_by(user: current_user)
      flash[:alert] = 'A user can vote 1 time!'
      redirect_to post_path
    end
    else
      @post.votes.build(voteable: @post, user: current_user, vote: params[:vote] )
      if @post.save
        respond_to do |format|
          format.html do
            flash[:notice] = 'Your vote was counted'
            redirect_to post_path
          end
          format.js
        end
      else
      render 'posts/show'
      end
  end


end



if @post.votes.find_by(user: current_user)
  flash[:alert] = 'A user can vote 1 time!'
  redirect_to posts_path
else
  @post.votes.build(voteable: @post, user: current_user, vote: params[:vote] )
  if @post.save
    respond_to do |format|
      format.html do
        flash[:notice] = 'Your vote was counted'
        redirect_to root_path
      end
      format.js
    end
  else
    render 'posts/index'
  end
end