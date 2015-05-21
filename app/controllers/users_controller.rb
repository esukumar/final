class UsersController < ApplicationController

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

  def destroy

  end
end