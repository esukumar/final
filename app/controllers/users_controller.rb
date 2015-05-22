class UsersController < ApplicationController
  before_action :authorize, only: [:show, :destroy]

  def authorize
    @user = User.find_by(id: params[:id])
    if @user.blank? || session[:user_id] != @user.id
      redirect_to root_url, notice: "Not Authorized"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:email], password: params[:password], name: params[:name])
    if @user.save
      redirect_to root_url, :flash => {:notice => "Thanks for signing up."}
    else
      render "new"
    end
  end

  def show

  end

  def destroy
    @user.delete
    reset_session
    redirect_to root_url, :flash => {:notice => "Your account has been deleted."}
  end
end