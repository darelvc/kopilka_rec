class PagesController < ApplicationController

	def index
		@recipe = Recipe.all.order("created_at DESC")

		# @recipe = @recipes.find(params[:id])

		@chef = Chef.all
	end

end