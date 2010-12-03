include SessionsHelper

class UsersController < ApplicationController
  
  before_filter :authenticate , :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => [:destroy]
  
  def index
    @title = "All Users"
    @users = User.paginate(:page => params[:page])
    @curr_user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
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
  
  
  
  def admin_user?
    current_user.admin?
  end
  
  private
  

  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end
  
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
  


end
