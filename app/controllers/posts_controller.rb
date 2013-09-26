class PostsController < ApplicationController
  # this method does this: @post = Post.find(params[:id])
  before_action :set_post, only: [:show, :edit, :update, :vote ]

  # this method does this:
#  # def require_user
#  if !logged_in?
#    flash[:error] = 'Must be logged in to do that'
#    redirect_to root_path
#  end

  before_action :require_user, only:[:new, :create, :edit, :update, :vote]

  def index
    @posts = Post.all


  end

  def show
   # @post = Post.find(params[:id])
  @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def vote
    Vote.create(voteable: @post, user: current_user, vote: params[:vote])

    if @post.votes.find_by(user: current_user)
      flash[:alert] = 'A user can vote only once!'
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





  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
     if @post.save
       flash[:notice] = 'you created a post'
       redirect_to root_path
     else
       render :new
     end

   # binding.pry

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
   @post = Post.find(params[:id])
    if @post.update (post_params)
      flash[:notice] = 'This was updated'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit!  #.permit.(:title, :url, :description, :category_ids)
  end




end
