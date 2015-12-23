class ChefsController < ApplicationController

	def index
	end

	def show
		@chef = Chef.find(params[:id])
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

	private

  def sign_up_params
    params.require(:chef).permit(:chefname, :email, :password, :password_confirmation, :adress)
  end

  def account_update_params
    params.require(:chef).permit(:chefname, :email, :password, :password_confirmation, :current_password)
  end
	
end
