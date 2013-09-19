class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]


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

  def create
    @post = Post.new(post_params)
    @post.creator = User.find(1) #for now....
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
