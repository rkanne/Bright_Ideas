class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirect_to "/users/#{user.id}"
      redirect_to "/bright_ideas"
    else
      flash[:errors] = ["Invalid"]
      redirect_to :back
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to "/main"
  end

end