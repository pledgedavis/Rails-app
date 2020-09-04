# require 'pry'
class SessionsController < ApplicationController

  def new 
    # render :login
    # byebug
    @user = User.new
    render :login
  end 

  def home 
    
  end

  def create 
      # byebug
      #finds created user by username and then uses authenticate to verify the password
      @user = User.find_by(username: params[:user][:username])
     if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to shoes_path
     else 
      flash[:error] = "Sorry, Your username or password was incorrect please try again!"
      redirect_to 'login'
     end
  end 
   #logout action 
  def destroy 
    session.clear
    redirect_to '/'
  end 
end