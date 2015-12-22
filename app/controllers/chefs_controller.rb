class ChefsController < ApplicationController

	def index
	end

	def show
		@chef = Chef.find(params[:id])
	end

	def create
		@chef = Chef.new(chef_params)

		if @chef.save
			redirect_to recipes_path, notice: "Новый пользователь создан успешно."
		else
			render 'new'
		end
	end

	private

	def chef_params
		params.require(:chef).permit(:chefname, :email, :password, :adress)
	end
	
end
