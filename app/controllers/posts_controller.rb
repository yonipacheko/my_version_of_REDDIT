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
    myArray = []  #empty array

    respond_to do |format|
      format.html
      format.js {render json: {myArray:  @posts.as_json(only: [:title])}.to_json }
    end


  end

  def show
   # @post = Post.find(params[:id])    we use set_post method
  @comment = Comment.new
  @posts = Post.all

  end

  def new
    @post = Post.new
  end

  def vote
   # Vote.create(voteable: @post, user: current_user, vote: params[:vote])

  #if @post.votes.find_by(user: current_user)
  #    flash[:alert] = 'A user can vote 1 time!'
  #    redirect_to posts_path
  #  else
  #    @post.votes.build(voteable: @post, user: current_user, vote: params[:vote] )
  #    if @post.save
  #      respond_to do |format|
  #        format.html do
  #          flash[:notice] = 'Your vote was counted'
  #          redirect_to root_path
  #        end
  #        format.js
  #      end
  #    else
  #      render 'posts/index'
  #  end
  #  end

    vote_action(@post)

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
   # @post = Post.find(params[:id])   we use set_post method
  end

  def update
   #@post = Post.find(params[:id])   we use set_post method
    if @post.update (post_params)
      flash[:notice] = 'This was updated'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find_by slug: params[:id]
  end
  def post_params
    params.require(:post).permit!  #.permit.(:title, :url, :description, :category_ids)
  end




end
