class RecipesController < ApplicationController
	before_action :authenticate_chef!

	def index
		@recipe = Recipe.all.order("created_at DESC")
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new
	end

	def create
		#@recipe = Recipe.new(recipe_params)
		#@chef = Chef.find(1)

		@recipe = current_chef.recipes.build(recipe_params)

		if @recipe.save
			redirect_to @recipe, notice: "Новый рецепт создан успешно."
		else
			render 'new'
		end
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe), notice: "Ваш рецепт обновлен успешно!"
		else
			render 'edit'
		end
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :summary, :description, :difficulty, :pre_time, :cook_time, :servers, :chef_id, ingredients_attributes: [:id, :name, :quantity, :_destroy])
	end

end