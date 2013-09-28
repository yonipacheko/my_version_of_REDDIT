class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      flash[:notice] = 'New category created'
      redirect_to root_path
    else
      render :new

    end

    def show

      @post = Post.find(params[:id])
      @show_category = Category.find(params[:id])
      @categories = Category.all

    end
  end
end
