class RecipesController < ApplicationController

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

		@recipe = current_user.recipes.build(recipe_params)

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
			flash[:success] = "Ваш рецепт обновлен успешно!"
			redirect_to recipe_path(@recipe)
		else
			render 'edit'
		end
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :summary, :description, :difficulty, :pre_time, :cook_time, :servers, :chef_id)
	end

end