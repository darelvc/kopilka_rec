class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_chef!, except: [:index, :show]

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
	end

	def new
		@post = current_chef.posts.build
	end

	def create
		@post = current_chef.posts.build(post_params)

		if @post.save
			redirect_to @post, notice: "Новая статья создана успешно."
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Ваша статья обновлена успешно."
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path, notice: "Ваша статья удалена успешно."
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :post_image)
	end

end
