class SessionsController < ApplicationController

  def create
    user = User.find_by(email_address: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # flash[:notice] = "Logged in successfully."
      redirect_to '/welcome'
    else
      # flash.now[:alert] = "Invalid email or password."
      render 'new'
    end
  end
   
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end
end
