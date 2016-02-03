class PagesController < ApplicationController

	def index
		@recipe = Recipe.all.order("created_at DESC")

		@recipe_day = Recipe.order("RANDOM()").first

		@last_recipe = Recipe.select("date(created_at) as created_date").group("created_date") 

	end

	def contacts

	end

end