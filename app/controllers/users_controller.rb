class UsersController < ApplicationController
 # before_action :require_login, except: [:new, :create]
  # before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to '/main'
  end
  
  def new
     
  end
  def create

    @user = User.create(name: params[:name], alias:params[:alias], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
       if @user.errors.any?
          flash[:errors] = @user.errors.full_messages
          redirect_to :back
      else
          last_user = User.last
          session[:user_id] = last_user.id
          redirect_to "/bright_ideas"   
      end
  end

  def show
  	@user = User.find(params[:id])
    @post = Post.where(user_id: params[:id])
    @like = Like.where(user_id: params[:id])
    @count_posts = @post.count
    @count_likes = @like.count
  
  end
  # def edit
  #   @user = User.find(params[:id])
  # end
  def update
    user = User.find(params[:id])
    @user = User.where(id:params[:id]).update_all(email:params[:email],name:params[:name])

    if user.id != session[:user_id]
       redirect_to("/users/#{session[:user_id]}")
    elsif @user
      flash[:success] = "Edit User successfully updated"
      redirect_to "/users/#{params[:id]}"   
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end 
  
  def destroy
      destroy = User.find(params[:id]).destroy

      if destroy.id != session[:user_id]
        redirect_to("/users/#{session[:user_id]}")
      else
        session[:user_id] = nil
        redirect_to '/main' 
    end      
  end
end