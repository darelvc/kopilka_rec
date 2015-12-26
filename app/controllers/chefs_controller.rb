class ChefsController < ApplicationController
	before_action :authenticate_chef!, except: [:index, :show]
	before_action :set_chef, only: [:edit, :update, :show]

	def index
	end

	def show
		#@recipes = current_chef.recipes.find(params[:id])
	end

	def create
		@chef = Chef.new(sign_up_params)

		if @chef.save
			session[:chef_id] = @chef.id
			redirect_to recipes_path, notice: "Новый пользователь создан успешно."
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @chef.update(chef_params)
			flash[:success] = "Your profile has been updated successfully!"
			redirect_to chef_path(@chef)
		else
			render 'edit'
		end
	end

	private

	def set_chef
		@chef = Chef.find(params[:id])
	end

  def sign_up_params
    params.require(:chef).permit(:chefname, :email, :password, :password_confirmation, :adress)
  end

  def account_update_params
    params.require(:chef).permit(:chefname, :email, :password, :password_confirmation, :current_password, :adress, :chef_image)
  end
	
end
