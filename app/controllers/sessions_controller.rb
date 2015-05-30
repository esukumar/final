class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Welcome back!"
      else
        flash[:notice] = "Unknown email or password."
        render 'new'
      end
    else
      flash[:notice] = "Unknown email or password."
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "You have Signed Out!"
  end
end
