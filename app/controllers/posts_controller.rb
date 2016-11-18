class PostsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]
	def index
		@post = Post.all
		@like = Like.all
		@user = User.find(session[:user_id])

	end
	def create
		post = Post.create(content: params[:New_post], user_id: session[:user_id])
       if post.errors.any?
	        flash[:success] = post.errors.full_messages
	        redirect_to "/users/#{post.user_id}"
      else
	      	flash["success"] = "Post created!" 
	        redirect_to "/bright_ideas"
      end	
	end
	def destroy
	    post = Post.find(params[:id])
	    post.destroy if post.user == current_user
	    redirect_to "/bright_ideas"
  	end
end
