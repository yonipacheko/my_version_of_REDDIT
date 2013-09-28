class CategoriesController < ApplicationController
  before_action :require_admin
  def new
    @category = Category.new
    #@test = 'fck u app'

  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      flash[:notice] = 'New category created'
      redirect_to root_path
    else
      render :new

    end
  end
  def show
      @categories = Category.all
      @test = 'fck u app'
      #@post = Post.find(params[:id])
      @show_category = Category.find_by slug: params[:id]

  end

end
