class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes
  end

  def new
    @category = Category.new
  end

  def create
    #binding.pry
    @category = Category.new(style_params)
    if @category.save
      redirect_to recipes_path, notice: "Категория создана успешно"
    else
      render 'new'
    end
  end

  private

  def style_params
    params.require(:category).permit(:name)
  end
end
