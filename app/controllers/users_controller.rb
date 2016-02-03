class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_user, only: [:edit, :update, :show]

	def index

	end

	def show
		#@recipes = current_chef.recipes.find(params[:id])
		@recipe = Recipe.find(params[:id])
	end

	def create
		@user = User.new(sign_up_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to recipes_path, notice: "Новый пользователь создан успешно."
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @user.update(chef_params)
			flash[:success] = "Your profile has been updated successfully!"
			redirect_to chef_path(@user)
		else
			render 'edit'
		end
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

  def sign_up_params
    params.require(:user).permit(:chefname, :email, :password, :password_confirmation, :adress)
  end

  def account_update_params
    params.require(:user).permit(:chefname, :email, :password, :password_confirmation, :current_password, :adress, :user_image)
  end
	
end
