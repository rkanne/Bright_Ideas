class LikesController < ApplicationController
	before_action :require_login, only: [:index, :destroy]
	# before_action :require_correct_user, only: [:index, :destroy]
 	def index
	end
	def create
		@post = Post.where(user: params[:id])
		like = Like.create(user_id: session[:user_id], post_id: params[:post_id])		
		redirect_to '/bright_ideas'
	end

	def show
		 @post = Post.find(params[:id])
		 @like = Like.where(post_id: params[:id])
	end

	def destroy
		destroy = Like.where(user_id: session[:user_id]).where(post_id: params[:post_id])
		if !destroy
			flash[:errors] = "You cannot unlike that"
		else
			destroy.destroy_all
		end
		redirect_to '/bright_ideas'

	end
end