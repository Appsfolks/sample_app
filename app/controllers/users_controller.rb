class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @title = 'Sign up'
    @user = User.new
  end
  
  def create 
    @user = User.new(params[:user])
    if @user.save
      #handle user save
      flash[:success] = "Welcome to Sample App"
      redirect_to @user
    else
      @title = 'Sign up'
      render 'new'
    end 
  end 

end
