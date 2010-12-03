class UsersController < ApplicationController
  
  before_filter :authenticate , :only => [:edit, :update]
  
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
      sign_in @user
      flash[:success] = "Welcome to Sample App"
      redirect_to @user
    else
      @title = 'Sign up'
      render 'new'
    end 
  end 
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit user" 
  end
  
  def update
    @user = User.find(params[:id]) 
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user 
    else
      @title = "Edit user"
      render 'edit' 
    end
  end
  
  private
  
  def authenticate
    deny_access unless signed_in?
  end

end
